package Qaru.Prj.controller;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Menu;
import Qaru.Prj.domain.request.MenuCreateRequest;
import Qaru.Prj.domain.request.ReservationDataRequest;
import Qaru.Prj.domain.response.*;
import Qaru.Prj.repository.Impl.ShopRepositoryImpl;
import Qaru.Prj.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ShopController {

    private final ShopService shopService;
    private final ImageService imageService;
    private final FileService fileService;
    private final MenuService menuService;
    private final ImageGroupService imageGroupService;

    @GetMapping("/shop/shopList")
    public String shopList(Pageable pageable, Model model){

        List<ShopListResponse> shopListResponses =
                shopService.shopListAll(pageable).toList();


        if (shopListResponses.size() > 0) {
            model.addAttribute("shopList", shopListResponses);
            model.addAttribute("shopListCount", shopService.searchTourListAllCount());


            int pageNum = 0;
            int searchPageAllNum = (int) (shopService.searchTourListAllCount() / pageable.getPageSize());

            // 전체 페이지 조회 - searchPageAllNum
            if (shopService.searchTourListAllCount() % pageable.getPageSize() > 0) {
                searchPageAllNum++;
            }

            // 페이지 num 이 3보다 작을 경우 1부터 시작하게 셋팅
            // [1] : 선택 페이지가 3 이하일 경우 [<<] 클릭 시 1페이지로 돌아가게 설정
            if (pageable.getPageNumber() < 3) {
                pageNum = 0;
            // [2] : 전체 페이지가 5 이하일 시 [<<] 클릭 시 1페이지로 돌아가게 설정
            } else if (searchPageAllNum < 6) {
                pageNum = 0;
            } else {
            // [3] : 선택 페이지 - 2부터 출력하도록 설정
                pageNum = pageable.getPageNumber() - 2;
            }

            int endPageNum = 0;

            // [4] : 전체 페이지가 5 이하 이거나, 현재 페이지가 3페이지 이하인 경우
            if (pageNum == 0) {
            // [5] : 전체 페이지가 4 이상인데 전체 페이지가 5일 경우 1 ~ 5까지 출력 되도록 설정
                if (searchPageAllNum > 4) {
                    endPageNum = 4;
                } else {
            // [6] : 전체 페이지가 4 이하 일 때 전체페이지 만큼만 출력되도록 설정
                    endPageNum = searchPageAllNum - 1;
                }
            } else {
//                if (searchPageAllNum < 6) {
//                    endPageNum = searchPageAllNum - 1;
//                }
            // [7] : 선택 페이지에서 [>>] 버튼을 눌렀을 때 전체 페이지를 넘는경우
                if (pageable.getPageNumber() + 3 > searchPageAllNum) {
                    endPageNum = searchPageAllNum - 1;
            // [8] : [>>] 전체 페이지 클릭 시 현재 페이지 + 2
                } else {
                    endPageNum = pageable.getPageNumber() + 2;
                }
            }

            model.addAttribute("pageNum", pageNum);
            model.addAttribute("endPageNum", endPageNum);
            model.addAttribute("getPageNum", pageable.getPageNumber());

        } else {
            model.addAttribute("shopListCount", shopService.searchTourListAllCount());
        }
        return "/shop/shopList";
    }

    @ResponseBody
    @GetMapping("/shop/search")
    public List<ShopListResponse> shopSearch(@RequestParam(value = "searchType", required = false) String searchType,
                             @RequestParam(value = "searchContent", required = false) String searchContent){

        List<ShopListResponse> shopListResponses =
                shopService.searchShopListAll(searchType, searchContent);

        return shopListResponses;
    }

    @GetMapping("/shop/menu")
    public String createMenu(@AuthenticationPrincipal PrincipalDetails request, Model model){

        ShopListResponse shopResponse = shopService.shopDataByUserId(request.getUser().getId());

        model.addAttribute("shopData", shopResponse);

        return "/shop/createMenu";
    }

    @ResponseBody
    @PostMapping("/shop/menuImage")
    public List<Long> createMenuImg(List<MultipartFile> file) throws IOException {

        List<Long> groupIdList = new ArrayList<>();
        for(int i = 0; i < file.size(); i++){

            String storedName = fileService.serverUploadFile(file.get(i));
            Long ImageGroupId = imageService.imageSave(file.get(i), storedName, imageGroupService.createImageGroup());
            groupIdList.add(ImageGroupId);
        }

        return groupIdList;
    }

    @ResponseBody
    @PostMapping("/shop/menuData")
    public int createMenuData(@AuthenticationPrincipal PrincipalDetails request,
                                  @RequestBody List<MenuCreateRequest> menuData){

        List<Menu> menuAll = menuService.createMenuAll(request, menuData);

        return menuAll.size();
    }

    @GetMapping("/shop/createMenuAlert")
    public String createMenuAlert(Model model){

        model.addAttribute("successAlert", 5);
        return "/successAlert";
    }

    @GetMapping("/shop/modifyMenuAlert")
    public String modifyMenuAlert(Model model){

        model.addAttribute("successAlert", 6);
        return "/successAlert";
    }

    @GetMapping("/shop/menu/{id}")
    public String menuModifyForm(Model model, @PathVariable Long id, @AuthenticationPrincipal PrincipalDetails request){

        List<MenuListResponse> menuList = menuService.getMenuList(id);
        ShopListResponse shopListResponse = shopService.shopDataByUserId(request.getUser().getId());

        model.addAttribute("shopData", shopListResponse);
        model.addAttribute("menuList", menuList);
        model.addAttribute("menuListCount", menuList.size());
        return "/shop/modifyMenu";
    }

    @ResponseBody
    @PostMapping("/shop/menuImage/{id}")
    public List<Long> modifyMenuImg(@PathVariable Long id, List<MultipartFile> file) throws IOException {

        List<Long> imageGroupIdList = menuService.modifyMenuImages(file, id);

        return imageGroupIdList;
    }

    @ResponseBody
    @PostMapping("/shop/menuData/{id}")
    public int modifyMenuData(@AuthenticationPrincipal PrincipalDetails request,
                                  @PathVariable Long id,
                                  @RequestBody List<MenuCreateRequest> menuData){

        List<Menu> menus = menuService.modifyMenuAll(id, menuData);

        return menus.size();
    }

    @GetMapping("/shop/reservation/{id}")
    public String reservationGet(@AuthenticationPrincipal PrincipalDetails reqeust, @PathVariable("id") Long id, Model model){

        model.addAttribute("shopData", shopService.shopDataByShopId(id));
        
        return "/shop/reservation";
    }

    @ResponseBody
    @GetMapping("/shop/reservation-time/{id}")
    public ShopRervationListResponse reservationTimeSearch(@AuthenticationPrincipal PrincipalDetails request,
                                      @PathVariable("id") Long id,
                                      @RequestParam("reservationDate") String date){


        return shopService.searchReservationList(id, date);
    }

    @ResponseBody
    @PostMapping("/shop/reservation-time/{id}")
    public ReservationDataResponse reservationSet(@AuthenticationPrincipal PrincipalDetails request,
                                                  @PathVariable("id") Long id,
                                                  @ModelAttribute ReservationDataRequest reservationRequest){

        return shopService.reservationSave(reservationRequest, request.getUser().getId(), id);
    }

}

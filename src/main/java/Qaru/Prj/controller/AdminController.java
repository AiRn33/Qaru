package Qaru.Prj.controller;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.StatusType;
import Qaru.Prj.domain.request.ShopUpdateRequest;
import Qaru.Prj.domain.request.UserAdminChangeRequest;
import Qaru.Prj.domain.response.*;
import Qaru.Prj.error.ScriptErrors;
import Qaru.Prj.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final UserService userService;
    private final ShopService shopService;
    private final FileService fileService;
    private final ImageService imageService;
    private final OrderService orderService;

    @GetMapping("/admin/home")
    public String home(@AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        User user = userService.getUserByUserId(request.getUsername());

        model.addAttribute("userData", new UserMypageRespose().userUpdate(user));
        model.addAttribute("adminCheck", userService.userSignupAdminCheck(request));
        model.addAttribute("shopData", new MypageShopResponse().mypageShop(shopService.getShop(request)));

        return "/admin/home";
    }

    @GetMapping("/admin/change-admin")
    public String changeRoleAdmin(@AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        model.addAttribute("userData", new UserMypageRespose().userUpdate(userService.getUserByUserId(request.getUsername())));

        return "/admin/adminForm";
    }

    @PostMapping("/admin/change-admin")
    public String changeRoleAdminPost(@Valid UserAdminChangeRequest userRequest, BindingResult bindingResult,
                                      @AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        // valid에 걸릴 시
        if(bindingResult.hasErrors() || userRequest.getFile().getSize() < 1){
            List errors = new ScriptErrors().errors(bindingResult);
            model.addAttribute("errorScript", errors);
            model.addAttribute("shopData", userRequest);
            model.addAttribute("commentCheck", userRequest.getShopComment().length() < 1 ? true : false);
            model.addAttribute("errorScriptImg", "[이미지가 등록되지 않았습니다., img]");

            return "/admin/adminForm";
        }

        if(userRequest.getShopType().split(",").length > 3){
            List errors = new ArrayList();
            errors.add("가게 종류가 3개를 초과하였습니다., shopType");
            model.addAttribute("errorScript", errors);
            model.addAttribute("shopData", userRequest);
            model.addAttribute("commentCheck", userRequest.getShopComment().length() < 1 ? true : false);

            return "/admin/adminForm";
        }

        model.addAttribute("successAlert", 2);

        String storedName = fileService.serverUploadFile(userRequest.getFile());

        Long shopId = shopService.createAdmin(userRequest, storedName, request);

        if(shopId > 0L){
            return "/successAlert";
        }

        return "/error";
    }

    @GetMapping("/admin/change-admin-modify")
    public String changeRoleAdminModify(@AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        UserAdminUpdateResponse response = userService.userAdminUpdate(request);
        response.shopOpenTimeSet();

        ImageResponse imageResponse = new ImageResponse().selectImage(imageService.imageSelectAll(response.getImageGroup().getId()).get(0));

        model.addAttribute("shopData", response);
        model.addAttribute("images", imageResponse);

        return "/admin/adminUpdateForm";
    }

    @PostMapping("/admin/change-admin-modify")
    public String changeRoleAdminModifyPost(@Valid ShopUpdateRequest userRequest, BindingResult bindingResult,
                                            @AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        UserAdminUpdateResponse response = userService.userAdminUpdate(request);

        // valid에 걸릴 시
        if(bindingResult.hasErrors()){

            List errors = new ScriptErrors().errors(bindingResult);
            model.addAttribute("errorScript", errors);
            model.addAttribute("shopData", userRequest);
            model.addAttribute("images", new ImageResponse().selectImage(imageService.imageSelectAll(response.getImageGroup().getId()).get(0)));
            model.addAttribute("commentCheck", userRequest.getShopComment().length() < 1 ? true : false);

            return "/admin/adminUpdateForm";
        }

        if(userRequest.getShopType().split(",").length > 3){
            List errors = new ArrayList();
            model.addAttribute("errorScript", errors.add("[가게 종류가 3개를 초과하였습니다., shopTypeArea]"));
            model.addAttribute("shopData", userRequest);
            model.addAttribute("commentCheck", userRequest.getShopComment().length() < 1 ? true : false);
        }

        if(!userRequest.getImageUpdateCheck()){

            // 기존 파일 삭제
            fileService.deleteFile(response.getStoredFileName());
            String storedName = fileService.serverUploadFile(userRequest.getFile());
            imageService.imageDelete(response.getImageGroup().getId());
            imageService.imageSave(userRequest.getFile(), storedName, response.getImageGroup());
        }

        shopService.updateShop(userRequest, request);
        model.addAttribute("successAlert", 3);

        return "/successAlert";
    }

    @GetMapping("/admin/orders")
    public String myOrders(@AuthenticationPrincipal PrincipalDetails request, Model model){

        List<OrdersResponse> ordersResponses = orderService.adminOrders(request);

        model.addAttribute("orders", ordersResponses);
        model.addAttribute("ordersCount", ordersResponses.size());

        return "/admin/orders";
    }

    @PostMapping("/admin/order/{id}")
    @ResponseBody
    public StatusType orderStatusUpdate(@PathVariable("id") Long id, @RequestParam("value") String value){

        StatusType result = orderService.updateOrderStatus(id, value);

        return result;
    }

    @GetMapping("/admin/statistics")
    public String statisticsPage(){
        return "/admin/statistics";
    }

    @GetMapping("/admin/city-statistics")
    public String cityStatisticsPage(Pageable pageable, Model model,
                                     @RequestParam(value = "startDate") String startDate,
                                     @RequestParam(value = "endDate") String endDate,
                                     @AuthenticationPrincipal PrincipalDetails request){

        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        return "/admin/cityStatistics";
    }
    @GetMapping("/admin/order-statistics")
    public String orderStatisticsPage(Pageable pageable, Model model,
                                     @RequestParam(value = "startDate") String startDate,
                                     @RequestParam(value = "endDate") String endDate,
                                     @AuthenticationPrincipal PrincipalDetails request){

        if(startDate.equals("")){
            LocalDateTime date = LocalDateTime.now();
            startDate = date.getYear() + "-" + date.getMonth() + "-" + date.getDayOfMonth();
        }
        if(endDate.equals("")){
            LocalDateTime date = LocalDateTime.now();
            endDate = date.getYear() + "-" + date.getMonth().getValue() + "-" + date.getDayOfMonth();
        }

        List<OrderStatisticsResponse> orderStatisticsResponseList = orderService.searchStatistics(pageable, request, startDate, endDate).toList();
        Long pageCount = orderService.searchStatisticsAllCount(request, startDate, endDate);

        if (orderStatisticsResponseList.size() > 0) {

            model.addAttribute("startDate", startDate);
            model.addAttribute("endDate", endDate);
            model.addAttribute("orderStatisticsList", orderStatisticsResponseList);
            model.addAttribute("orderStatisticsListCount", pageCount);

            int pageNum = 0;
            int searchPageAllNum = (int) (pageCount / pageable.getPageSize());
            if (pageCount % pageable.getPageSize() > 0) {
                searchPageAllNum++;
            }

            // 페이지 num 이 3보다 작을 경우 1부터 시작하게 셋팅
            if (pageable.getPageNumber() < 3) {
                pageNum = 0;
            } else if (searchPageAllNum < 6) {
                pageNum = 0;
            } else if (pageable.getPageNumber() + 3 > searchPageAllNum) {
                pageNum = (searchPageAllNum) - 5;
                if (pageNum < 1) {
                    pageNum = 0;
                }
            } else {
                pageNum = pageable.getPageNumber() - 2;
            }

            int endPageNum = 0;

            // 즉 3페이지 이전일 때
            if (pageNum == 0) {
                // 전체 페이지가 5 페이지 이상일 경우
                if (searchPageAllNum > 4) {
                    endPageNum = 4;
                } else {
                    endPageNum = searchPageAllNum - 1;
                }
            } else {
                if (searchPageAllNum < 6) {
                    endPageNum = searchPageAllNum - 1;
                } else if (pageable.getPageNumber() + 3 > searchPageAllNum) {
                    endPageNum = searchPageAllNum - 1;
                } else {
                    endPageNum = pageable.getPageNumber() + 2;
                }
            }

            model.addAttribute("pageNum", pageNum);
            model.addAttribute("pages", pageable.getPageNumber());
            model.addAttribute("endPageNum", endPageNum);

        } else {
            model.addAttribute("tourListCount", pageCount);
            model.addAttribute("orderStatisticsList", orderStatisticsResponseList);
            model.addAttribute("orderStatisticsListCount", pageCount);
            model.addAttribute("startDate", startDate);
            model.addAttribute("endDate", endDate);
        }


        return "/admin/orderStatistics";
    }

    @ResponseBody
    @PostMapping("/admin/order-statistics")
    public List<OrderMenuCheckResponse> orderStatisticsPage(@RequestParam("id") String id){


        return orderService.findOrderMenu(id);
    }
}

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
    public String cityStatisticsPage(){

        return "/admin/cityStatistics";
    }
    @GetMapping("/admin/order-statistics")
    public String shopStatisticsPage(Pageable pageable){

        System.out.println("============ > : " + pageable.getPageSize());
        System.out.println("============ > : " + pageable.getPageNumber());

        return "/admin/orderStatistics";
    }
}

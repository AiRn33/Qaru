package Qaru.Prj.controller;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.Menu;
import Qaru.Prj.domain.entity.Order;
import Qaru.Prj.domain.request.OrderRequest;
import Qaru.Prj.domain.response.MenuListResponse;
import Qaru.Prj.domain.response.OrdersResponse;
import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.domain.response.OrderMenuCheckResponse;
import Qaru.Prj.service.MenuService;
import Qaru.Prj.service.OrderService;
import Qaru.Prj.service.ShopService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {

    private final MenuService menuService;
    private final ShopService shopService;
    private final OrderService orderService;

    @GetMapping("/order/menu/{id}")
    public String orderMenuForm(Model model, @PathVariable Long id, @AuthenticationPrincipal PrincipalDetails request){

        List<MenuListResponse> menuList = menuService.getMenuList(id);
        ShopListResponse shopListResponse = shopService.shopDataByShopId(id);

        model.addAttribute("shopData", shopListResponse);
        model.addAttribute("menuList", menuList);
        model.addAttribute("menuListCount", menuList.size());
        return "/order/orderMenu";
    }

    @PostMapping("/order/menu/{id}")
    public String orderMenuCheckList(Model model,
                                     @PathVariable Long id,
                                     @RequestParam List<Long> inputCount,
                                     @RequestParam List<Long> menuId){

        List<Menu> menuList = menuService.selectMenuAll(menuId);

        List<OrderMenuCheckResponse> orderMenuCheckList = new ArrayList<>();
        int orderAllPrice = 0;

        for(int i = 0; i < menuList.size(); i++){
            if(inputCount.get(i) > 0){
                OrderMenuCheckResponse orderMenuCheckResponse = new OrderMenuCheckResponse().orderMenuSet(menuList.get(i), inputCount.get(i));
                orderMenuCheckList.add(orderMenuCheckResponse);
                orderAllPrice += orderMenuCheckResponse.getMenuAllPrice();
            }
        }

        model.addAttribute("shopId", id);
        model.addAttribute("orderData", orderMenuCheckList);
        model.addAttribute("orderAllPrice", orderAllPrice);
        model.addAttribute("orderMenuCount", orderMenuCheckList.size());
        return "/order/orderMenuCheck";
    }

    @ResponseBody
    @PostMapping("/order/{id}")
    public Long createOrder(@PathVariable Long id ,@RequestBody List<OrderRequest> orderRequest, @AuthenticationPrincipal PrincipalDetails request){

        List<Order> orderList = orderService.createOrder(orderRequest, request, id);

        return (long) orderList.size();
    }
}

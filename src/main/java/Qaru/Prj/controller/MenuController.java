package Qaru.Prj.controller;

import Qaru.Prj.repository.ShopRepository;
import Qaru.Prj.service.MenuService;
import Qaru.Prj.service.ShopService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequiredArgsConstructor
public class MenuController {

    private final ShopService shopService;
    private final MenuService menuService;

    @GetMapping("/menu/{id}")
    public String menuView(@PathVariable Long id, Model model){

        model.addAttribute("menuList", menuService.getMenuList(id));
        model.addAttribute("shopData", shopService.shopDataByShopId(id));

        return "/menu/view";
    }
}

package Qaru.Prj.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class MenuController {


    @GetMapping("/menu/{id}")
    public String menuView(Model model){

        return "/menu/view";
    }
}

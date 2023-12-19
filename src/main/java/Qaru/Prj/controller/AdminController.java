package Qaru.Prj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {

    /**
     *  -- Main index 파일 / 초기 화면
     * @return
     */
    @GetMapping("/admin/home")
    public String index(){

        return "/admin/home";
    }
}

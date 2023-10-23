package Qaru.Prj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    /**
     *  -- Main index 파일 / 초기 화면
     * @return
     */
    @GetMapping("/")
    public String index(){
        return "home";
    }
}

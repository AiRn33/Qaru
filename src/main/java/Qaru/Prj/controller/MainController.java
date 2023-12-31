package Qaru.Prj.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;

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

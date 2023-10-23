package Qaru.Prj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/user/login")
    public String userLogin(){
        return "/user/login";
    }

    @GetMapping("/user/signup")
    public String userSignup(){
        return "/user/signup";
    }
}

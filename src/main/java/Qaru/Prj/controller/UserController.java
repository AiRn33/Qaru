package Qaru.Prj.controller;

import Qaru.Prj.domain.request.UserSignUpRequest;
import Qaru.Prj.error.ScriptErrors;
import Qaru.Prj.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/user/login")
    public String userLogin(){
        return "/user/login";
    }

    @GetMapping("/user/signup")
    public String userSignup(){
        return "/user/signup";
    }

    @PostMapping("/user/signup")
    public String userSignupPost(@Valid UserSignUpRequest request, BindingResult result, Model model){

        // valid에 걸릴 시
        if(result.hasErrors()){
            List errors = new ScriptErrors().errors(result);
            model.addAttribute("errorScript", errors);
            return "/user/signup";
        }

        Boolean passwordCheck = userService.signup(request);

        if(!passwordCheck){
            model.addAttribute("errorScript", "[패스워드가 일치하지 않습니다.,userPw]");
            return "/user/signup";
        }
        model.addAttribute("email", request.getUserEmail());
        return "/user/emailAlram";
    }

    @GetMapping("/user/findId")
    public String findUserId(){ return "/user/findId";}

    @GetMapping("/user/findPassword")
    public String findUserPassword(){ return "/user/findPassword";}
}

package Qaru.Prj.controller;

import Qaru.Prj.domain.request.UserAuthRequest;
import Qaru.Prj.domain.request.UserSignUpRequest;
import Qaru.Prj.error.ScriptErrors;
import Qaru.Prj.service.EmailService;
import Qaru.Prj.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import javax.mail.MessagingException;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UserController {

    private final BCryptPasswordEncoder passwordEncoder;
    private final UserService userService;
    private final EmailService emailService;

    @GetMapping("/user/login")
    public String userLogin(){
        return "/user/login";
    }

    @GetMapping("/user/signup")
    public String userSignup(){
        return "/user/signup";
    }

    @PostMapping("/user/signup")
    public String userSignupPost(@Valid UserSignUpRequest request, BindingResult result, Model model) throws MessagingException, UnsupportedEncodingException {

        // valid에 걸릴 시
        if(result.hasErrors()){
            List errors = new ScriptErrors().errors(result);
            model.addAttribute("errorScript", errors);
            model.addAttribute("userData", request);
            return "/user/signup";
        }

        // 아이디, 이메일, 닉네임 중복 체크
        List duplicateMsg = userService.DuplicateCheck(request);
        Boolean duplicateCheck = false;
        if(duplicateMsg.size() > 0){
            duplicateCheck = true;
        }
        // 패스워드 일치하지 않을시
        if(!request.getUserPw().equals(request.getUserPwCk())){
            duplicateCheck = true;
            if(duplicateMsg.size() > 0){
                duplicateMsg.add("패스워드가 일치하지 않습니다.,userPw");
            }else{
                duplicateMsg = new ArrayList();
                duplicateMsg.add("패스워드가 일치하지 않습니다.,userPw");
            }
        }
        if(duplicateCheck){
            model.addAttribute("errorScript", duplicateMsg);
            model.addAttribute("userData", request);
            return "/user/signup";
        }

        // 성공 -> 이메일 인증 진행
        model.addAttribute("userData", request);
        emailService.sendMail(request.getUserEmail());
        return "/user/emailAlram";
    }

    @PostMapping("/user/emailCheck")
    public String emailCheck(@Valid UserAuthRequest request, BindingResult result, Model model){
        if(result.hasErrors()){
            List errors = new ScriptErrors().errors(result);
            model.addAttribute("errorScript", errors);
            model.addAttribute("userData", request);
            return "/user/emailAlram";
        }
        Boolean check = userService.authNumCheck(request);
        if(!check){
            model.addAttribute("errorScript", "[인증번호가 일치하지 않습니다.,authNum]");
            model.addAttribute("userData", request);
            return "/user/emailAlram";
        }

        userService.signup(new UserSignUpRequest(request));

        model.addAttribute("signupSuccess", true);
        return "/user/signupSuccessAlert";
    }
    @GetMapping("/user/findId")
    public String findUserId(){ return "/user/findId";}

    @GetMapping("/user/findPassword")
    public String findUserPassword(){ return "/user/findPassword";}
}

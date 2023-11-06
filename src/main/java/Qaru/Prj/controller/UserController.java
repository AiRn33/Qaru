package Qaru.Prj.controller;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.request.UserAdminChangeRequest;
import Qaru.Prj.domain.request.UserAuthRequest;
import Qaru.Prj.domain.request.UserSignUpRequest;
import Qaru.Prj.domain.request.UserUpdateRequest;
import Qaru.Prj.domain.response.UserMypageRespose;
import Qaru.Prj.error.ScriptErrors;
import Qaru.Prj.service.EmailService;
import Qaru.Prj.service.FileService;
import Qaru.Prj.service.ShopService;
import Qaru.Prj.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
    private final ShopService shopService;
    private final EmailService emailService;
    private final FileService fileService;

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
        List duplicateMsg = userService.duplicateCheck(request);
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

    @PostMapping("/user/email")
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

    @GetMapping("/user/mypage")
    public String userMypage(@AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        User user = userService.getUserByUserId(request.getUsername());

        model.addAttribute("userData", new UserMypageRespose().userUpdate(user));
        model.addAttribute("adminCheck", userService.userSignupAdminCheck(request));

        return "/user/mypage";
    }

    @GetMapping("/user/modify")
    public String userModify(@AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        User user = userService.getUserByUserId(request.getUsername());

        model.addAttribute("userData", new UserMypageRespose().userUpdate(user));

        return "/user/modifyForm";
    }

    @PostMapping("/user/modify")
    public String userModifyPost(@Valid UserUpdateRequest updateUser, BindingResult bindingResult, @AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        // valid에 걸릴 시
        if(bindingResult.hasErrors()){
            List errors = new ScriptErrors().errors(bindingResult);
            model.addAttribute("errorScript", errors);
            model.addAttribute("userData", new UserMypageRespose().userUpdate(userService.getUserByUserId(request.getUsername())));
            return "/user/modifyForm";
        }

        if(!request.getUser().getUserNickName().equals(updateUser.getUserNickname())){
            if(!userService.userNickNameEmptyCheck(updateUser)){
                model.addAttribute("errorScript", "[중복된 닉네임이 있습니다.,userNickname]");
                model.addAttribute("userData", new UserMypageRespose().userUpdate(userService.getUserByUserId(request.getUsername())));
                return "/user/modifyForm";
            }
        }
        userService.updateUser(updateUser);

        User user = userService.getUserByUserId(request.getUsername());

        model.addAttribute("userData", new UserMypageRespose().userUpdate(user));

        return "/user/mypage";
    }

    @GetMapping("/user/change-admin")
    public String changeRoleAdmin(@AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        System.out.println("=============> : " + userService.getUserByUserId(request.getUsername()).getUserId());
        model.addAttribute("userData", new UserMypageRespose().userUpdate(userService.getUserByUserId(request.getUsername())));

        return "/user/adminForm";
    }

    @PostMapping("/user/change-admin")
    public String changeRoleAdminPost(@Valid UserAdminChangeRequest userRequest, BindingResult bindingResult,
                                      @AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        // valid에 걸릴 시
        if(bindingResult.hasErrors()){
            List errors = new ScriptErrors().errors(bindingResult);
            model.addAttribute("errorScript", errors);
            model.addAttribute("shopData", userRequest);
            model.addAttribute("commentCheck", userRequest.getFile().getSize() < 1 ? true : false);

            return "/user/adminForm";
        }

        model.addAttribute("changeSuccess", true);

        String storedName = fileService.serverUploadFile(userRequest.getFile());

        Long shopId = shopService.createAdmin(userRequest, storedName, request);

        if(shopId > 0L){
            return "/user/userChangeAdminSuccessAlert";
        }

        return "/error";
    }

    @GetMapping("/user/change-admin/modify")
    public String changeRoleAdminModify(@Valid UserAdminChangeRequest userRequest, BindingResult bindingResult,
                                      @AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        userService.userAdminUpdate(request);

        return "/user/adminUpdateForm";
    }
    @PostMapping("/user/change-admin/modify")
    public String changeRoleAdminModifyPost(@Valid UserAdminChangeRequest userRequest, BindingResult bindingResult,
                                      @AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        // valid에 걸릴 시
        if(bindingResult.hasErrors()){
            List errors = new ScriptErrors().errors(bindingResult);
            model.addAttribute("errorScript", errors);
            model.addAttribute("shopData", userRequest);
            model.addAttribute("commentCheck", userRequest.getFile().getSize() < 1 ? true : false);

            return "/user/adminForm";
        }

        model.addAttribute("changeSuccess", true);

        String storedName = fileService.serverUploadFile(userRequest.getFile());

        Long shopId = shopService.createAdmin(userRequest, storedName, request);

        if(shopId > 0L){
            return "/user/userChangeAdminSuccessAlert";
        }

        return "/error";
    }

    @GetMapping("/user/find-id")
    public String findUserId(){ return "/user/findId";}

    @GetMapping("/user/find-password")
    public String findUserPassword(){ return "/user/findPassword";}

}

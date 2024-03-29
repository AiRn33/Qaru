package Qaru.Prj.controller;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.Image;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.ReservationType;
import Qaru.Prj.domain.request.*;
import Qaru.Prj.domain.response.*;
import Qaru.Prj.error.ScriptErrors;
import Qaru.Prj.jwt.AuthTokensGenerator;
import Qaru.Prj.jwt.JwtToken;
import Qaru.Prj.jwt.JwtTokenProvider;
import Qaru.Prj.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final ShopService shopService;
    private final EmailService emailService;
    private final FileService fileService;
    private final ImageService imageService;
    private final AuthenticationManagerBuilder authenticationManagerBuilder;
    private final AuthTokensGenerator generator;
    private final OrderService orderService;

    @GetMapping("/user/login")
    public String userLogin(){

        return "/user/login";
    }

    @PostMapping("/login")
    public String login(UserLoginRequest request, Model model){

        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(request.getUserId(), request.getUserPw());
        Authentication authentication = null;
        SecurityContextHolder.getContext().setAuthentication(authentication);
        try{
            authentication = authenticationManagerBuilder.getObject().authenticate(token);
        }catch (Exception e){
            model.addAttribute("errorScript", "[아이디 또는 비밀번호가 맞지않습니다. 다시확인해주세요, userPw]");

            return "/user/login";
        }
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
        JwtToken generate = generator.generate(principalDetails.getUser());

        model.addAttribute("accessToken", generate.getAccessToken());
        model.addAttribute("refreshToken", generate.getRefreshToken());

        return "/tokenSave";
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
        request.setSocialType();
        model.addAttribute("userData", request);
        emailService.sendMail(request.getUserEmail());
        return "/user/emailAlram";
    }

    @PostMapping("/user/signup-kakao")
    public String userSignupKakaoPost(@Valid KakaoSignUpRequest request, BindingResult result, Model model) throws MessagingException, UnsupportedEncodingException {

        // valid에 걸릴 시
        if(result.hasErrors()){
            List errors = new ScriptErrors().errors(result);
            model.addAttribute("errorScript", errors);
            model.addAttribute("userData", request);
            model.addAttribute("validCk", true);
            model.addAttribute("kakaoId", request.getKakaoId());
            return "/user/signupKakao";
        }

        // 아이디, 이메일, 닉네임 중복 체크
        List duplicateMsg = userService.duplicateCheck(request);


        Boolean duplicateCheck = false;
        if(duplicateMsg.size() > 0){
            duplicateCheck = true;
        }

        if(duplicateCheck){
            model.addAttribute("errorScript", duplicateMsg);
            model.addAttribute("userData", request);
            model.addAttribute("validCk", true);
            model.addAttribute("kakaoId", request.getKakaoId());

            return "/user/signupKakao";
        }

        // 성공 -> 이메일 인증 진행
        request.setEmailAlram();
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
        model.addAttribute("successAlert", 1);

        return "/successAlert";
    }

    @GetMapping("/user/mypage")
    public String userMypage(@AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        System.out.println("========== > 1");
        User user = userService.getUserByUserId(request.getUsername());
        System.out.println("========== > 2");
        model.addAttribute("userData", new UserMypageRespose().userUpdate(user));
        System.out.println("========== > 3");
        model.addAttribute("adminCheck", userService.userSignupAdminCheck(request));
        System.out.println("========== > 4");
        model.addAttribute("shopData", new MypageShopResponse().mypageShop(shopService.getShop(request)));

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

        model.addAttribute("successAlert", 7);

        return "/successAlert";
    }

    @GetMapping("/user/find-id")
    public String findUserId(){ return "/user/findId";}

    @ResponseBody
    @PostMapping("/user/find-id")
    public String findUserIdPost(@RequestParam String email){

        String userId = userService.findUserId(email);

        return userId;
    }

    @GetMapping("/user/find-password")
    public String findUserPassword(){ return "/user/findPassword";}

    @ResponseBody
    @PostMapping("/user/find-password")
    public Long findUserIdPost(@RequestParam String email, @RequestParam String userId){

        Long id = userService.findUserByEamilAndId(email, userId);

        return id;
    }

    @GetMapping("/user/password/{id}")
    public String changeUserPassword(@PathVariable Long id, Model model){

        model.addAttribute("userId", id);

        return "/user/passwordChangeForm";
    }

    @ResponseBody
    @PostMapping("/user/password/{id}")
    public Long changeUserPasswordPost(@PathVariable Long id,
                                      @RequestParam String password,
                                      Model model){

        Long result = userService.changePassword(id, password);

        return result;
    }

    @GetMapping("/user/orders")
    public String myOrders(@AuthenticationPrincipal PrincipalDetails request, Model model){

        List<OrdersResponse> ordersResponses = orderService.myOrders(request);

        model.addAttribute("orders", ordersResponses);
        model.addAttribute("ordersCount", ordersResponses.size());

        return "/user/orders";
    }

    @GetMapping("/user/reservations")
    public String myReservations(@AuthenticationPrincipal PrincipalDetails request, Model model){

        List<ReservationListResponse> reservationListResponses = shopService.reservationList(request);

        model.addAttribute("reservationData", reservationListResponses);
        model.addAttribute("reservationCount", reservationListResponses.size());

        return "/user/reservations";
    }

    @ResponseBody
    @GetMapping("/user/reservationMsg/{id}")
    public String reservationMsg(@PathVariable("id") Long id){

        return shopService.reservationMsg(id);
    }

    @ResponseBody
    @GetMapping("/user/reservationStatus/{id}")
    public ReservationType reservationStatusChange(@PathVariable("id") Long id){

        return shopService.reservationStatusChange(id, "cencel");
    }
}

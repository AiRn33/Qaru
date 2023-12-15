package Qaru.Prj.controller;

import Qaru.Prj.jwt.JwtTokenProvider;
import Qaru.Prj.oauth.*;
import Qaru.Prj.jwt.JwtToken;
import Qaru.Prj.jwt.AuthTokensGenerator;
import Qaru.Prj.oauth.kakao.KakaoLoginParams;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class OAuthController {

    private final OAuthLoginService oAuthLoginService;
    private final AuthTokensGenerator authTokensGenerator;
    private final JwtTokenProvider jwtTokenProvider;

    @GetMapping("/kakao/login")
    public String kakaoLogin(@RequestParam("code") String code, Model model){

        KakaoLoginParams params = new KakaoLoginParams(code);

        OAuthInfoResponse loginResponse = oAuthLoginService.login(params);

        if(loginResponse.getSignUpCheck()){
            // 회원가입 페이지 이동
            model.addAttribute("kakaoId", loginResponse.getId());
            return "/user/signupKakao";
        }else{
            // 로그인 된 유저
//            JwtToken generate = authTokensGenerator.generate();

        }

        return "/user/login";
    }

}

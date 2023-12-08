package Qaru.Prj.controller;

import Qaru.Prj.oauth.AuthTokens;
import Qaru.Prj.oauth.KakaoLoginParams;
import Qaru.Prj.oauth.OAuthLoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class OAuthController {

    private final OAuthLoginService oAuthLoginService;

    @GetMapping("/kakao/login")
    public String kakaoLogin(@RequestParam("code") String code){

        KakaoLoginParams params = new KakaoLoginParams(code);

        AuthTokens login = oAuthLoginService.login(params);


        return "/user/login";
    }

}

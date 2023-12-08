package Qaru.Prj.oauth;

import Qaru.Prj.domain.enums.UserType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

public class KakaoLoginParams implements OAuthLoginParams{

    private String authorizationCode;

    public KakaoLoginParams(String code) {
        authorizationCode = code;
    }


    @Override
    public UserType oAuthProvider() {
        return UserType.KAKAO;
    }

    @Override
    public MultiValueMap<String, String> makeBody() {

        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("code", authorizationCode);
        return body;
    }

    @Override
    public String getCode() {
        return authorizationCode;
    }
}

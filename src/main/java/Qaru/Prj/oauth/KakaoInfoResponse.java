package Qaru.Prj.oauth;

import Qaru.Prj.domain.enums.UserType;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class KakaoInfoResponse implements OAuthInfoResponse {

    @JsonProperty("kakao_account")
    private KakaoAccount kakaoAccount;

    @JsonProperty("id")
    private String id;

    private Boolean signupCheck;

    @Getter
    @JsonIgnoreProperties(ignoreUnknown = true)
    static class KakaoAccount {
        private KakaoProfile profile;
        private String email;
    }

    @Getter
    @JsonIgnoreProperties(ignoreUnknown = true)
    static class KakaoProfile {
        private String nickname;
    }

    @Override
    public String getEmail() {
        return kakaoAccount.email;
    }



    @Override
    public String getNickname() {
        return kakaoAccount.profile.nickname;
    }

    @Override
    public Boolean getSignUpCheck() {
        return signupCheck;
    }

    @Override
    public void setSingUpCheck(Boolean signupCheck) {
        this.signupCheck = signupCheck;
    }


    @Override
    public UserType getOAuthProvider() {
        return UserType.KAKAO;
    }
}
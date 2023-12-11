package Qaru.Prj.oauth;

import Qaru.Prj.domain.enums.UserType;

public interface OAuthInfoResponse {
    String getEmail();
    String getNickname();

    Boolean getSignUpCheck();

    String getId();

    void setSingUpCheck(Boolean signupCheck);

    UserType getOAuthProvider();
}

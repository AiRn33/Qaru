package Qaru.Prj.oauth;

import Qaru.Prj.domain.enums.UserType;

public interface OAuthInfoResponse {
    String getEmail();
    String getNickname();

    String getId();
    UserType getOAuthProvider();
}

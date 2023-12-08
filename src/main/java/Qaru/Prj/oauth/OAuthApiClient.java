package Qaru.Prj.oauth;

import Qaru.Prj.domain.enums.UserType;

public interface OAuthApiClient {
    UserType oAuthProvider();
    String requestAccessToken(OAuthLoginParams params);
    OAuthInfoResponse requestOauthInfo(String accessToken);
}

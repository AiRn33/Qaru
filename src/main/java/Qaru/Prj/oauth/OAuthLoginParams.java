package Qaru.Prj.oauth;

import Qaru.Prj.domain.enums.UserType;
import org.springframework.util.MultiValueMap;

public interface OAuthLoginParams {
    UserType oAuthProvider();
    MultiValueMap<String, String> makeBody();

    String getCode();
}

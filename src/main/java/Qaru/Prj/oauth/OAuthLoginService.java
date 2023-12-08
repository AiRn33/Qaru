package Qaru.Prj.oauth;

import Qaru.Prj.domain.entity.User;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor

public class OAuthLoginService {
    private final UserRepository userRepository;
    private final AuthTokensGenerator authTokensGenerator;
    private final RequestOAuthInfoService requestOAuthInfoService;

    public AuthTokens login(OAuthLoginParams params) {
        OAuthInfoResponse oAuthInfoResponse = requestOAuthInfoService.request(params);

        Long memberId = findUser(oAuthInfoResponse);
        return authTokensGenerator.generate(memberId);
    }

    private Long findUser(OAuthInfoResponse oAuthInfoResponse) {

        Optional<User> findUser = userRepository.findByUserId(oAuthInfoResponse.getId());

        // 로그인시 id 체크
        if(findUser.isPresent()){
            return 0L;
        }else{
            return findUser.get().getId();
        }

    }

}

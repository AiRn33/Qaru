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
    private final RequestOAuthInfoService requestOAuthInfoService;

    public OAuthInfoResponse login(OAuthLoginParams params) {

        OAuthInfoResponse oAuthInfoResponse = requestOAuthInfoService.request(params);

        Long memberId = findUser(oAuthInfoResponse);

        if(memberId < 1L){
            // 회원가입 된 유저 없음
            oAuthInfoResponse.setSingUpCheck(true);
            return oAuthInfoResponse;
        }else{
            // 회원가입 된 유저 있음
            oAuthInfoResponse.setSingUpCheck(false);
            return oAuthInfoResponse;
        }
    }

    private Long findUser(OAuthInfoResponse oAuthInfoResponse) {

        Optional<User> findUser = userRepository.findByUserId(oAuthInfoResponse.getId() + "_kakao");

//      로그인시 id 체크
        if(!findUser.isPresent()){
            // 회원가입 된 유저가 없음
            return 0L;
        }else{
            return findUser.get().getId();
        }

    }

}

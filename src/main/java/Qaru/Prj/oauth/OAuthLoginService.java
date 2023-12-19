package Qaru.Prj.oauth;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.repository.UserRepository;
import Qaru.Prj.service.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class OAuthLoginService {

    private final UserRepository userRepository;
    private final RequestOAuthInfoService requestOAuthInfoService;
    private final AuthenticationManagerBuilder authenticationManagerBuilder;

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
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(oAuthInfoResponse.getId() + "_kakao", "kakao_1230");
            Authentication authentication = authenticationManagerBuilder.getObject().authenticate(token);
            SecurityContextHolder.getContext().setAuthentication(authentication);
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

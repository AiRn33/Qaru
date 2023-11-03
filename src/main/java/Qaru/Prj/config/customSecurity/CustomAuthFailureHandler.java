package Qaru.Prj.config.customSecurity;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@Component
@Slf4j
public class CustomAuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {
    /**
     * HttpServletRequest : Request 정보
     * HttpServletResponse : Response에 대해 설정할 수 있는 변수
     * AuthenticationException : 로그인 실패 시 예외에 대한 정보
     */

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {


        String errorMessage = "";

        if (exception instanceof BadCredentialsException) {
            errorMessage = "[아이디 또는 비밀번호가 맞지않습니다. 다시확인해주세요, userPw]";
        }else{
            errorMessage = "[알 수 없는 에러가 발생했습니다., userPw]";
        }

        errorMessage = URLEncoder.encode(errorMessage, "UTF-8"); /* 한글 인코딩 깨지는 문제 방지 */
        setDefaultFailureUrl("/user/login?errorMsg=" + errorMessage);
        super.onAuthenticationFailure(request, response, exception);
    }
}
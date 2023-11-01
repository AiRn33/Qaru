package Qaru.Prj.service;

import Qaru.Prj.domain.request.UserSignUpRequest;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final BCryptPasswordEncoder passwordEncoder;
    private final UserRepository userRepository;
    public Boolean signup(UserSignUpRequest request) {

        if(!request.getUserPw().equals(request.getUserPwCk())){
            /* password가 일치하지 않을 시 */
            return false;
        }
        request.setUserPw(passwordEncoder.encode(request.getUserPw()));
        userRepository.save(request.toEntity());

        return true;
    }
}

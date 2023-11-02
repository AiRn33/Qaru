package Qaru.Prj.service;

import Qaru.Prj.domain.request.UserAuthRequest;
import Qaru.Prj.domain.request.UserSignUpRequest;
import Qaru.Prj.email.RedisUtil;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.LinkedList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final RedisUtil redisUtil;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public Boolean signup(UserSignUpRequest request) {

        request.setUserPw(bCryptPasswordEncoder.encode(request.getUserPw()));
        userRepository.save(request.toEntity());

        return true;
    }

    public Boolean authNumCheck(UserAuthRequest request) {

        String email = redisUtil.getData(request.getAuthNum());
        if(!StringUtils.hasText(email)){
            return false;
        }
        if(email.equals(request.getEmail())){
            return true;
        }else{
            return false;
        }
    }

    public List DuplicateCheck(UserSignUpRequest request) {

        List msg = new LinkedList();

        if(userRepository.findByUserId(request.getUserId()).isPresent()){
            msg.add("중복 된 유저 아이디가 있습니다.,userId");
        }

        if(userRepository.findByUserEmail(request.getUserEmail()).isPresent()){
            msg.add("중복 된 유저 이메일이 있습니다.,userEmail");
        }

        if(userRepository.findByUserNickName(request.getUserNickname()).isPresent()){
            msg.add("중복 된 유저 닉네임이 있습니다.,userNickname");
        }

        return msg;
    }
}

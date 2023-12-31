package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.request.KakaoSignUpRequest;
import Qaru.Prj.domain.request.UserAuthRequest;
import Qaru.Prj.domain.request.UserSignUpRequest;
import Qaru.Prj.domain.request.UserUpdateRequest;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import Qaru.Prj.email.RedisUtil;
import Qaru.Prj.repository.Impl.UserRepositoryImpl;
import Qaru.Prj.repository.ShopRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.util.*;

@Service
@RequiredArgsConstructor
public class UserService {

    private final BCryptPasswordEncoder passwordEncoder;
    private final UserRepository userRepository;
    private final RedisUtil redisUtil;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final ShopRepository shopRepository;
    private final UserRepositoryImpl userRepositoryImpl;

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

    public List duplicateCheck(UserSignUpRequest request) {

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

    public List duplicateCheck(KakaoSignUpRequest request) {

        List msg = new ArrayList();

        if(userRepository.findByUserEmail(request.getUserEmail()).isPresent()){
            msg.add("중복 된 유저 이메일이 있습니다.,userEmail");
        }

        if(userRepository.findByUserNickName(request.getUserNickname()).isPresent()){
            msg.add("중복 된 유저 닉네임이 있습니다.,userNickname");
        }

        return msg;
    }

    public User getUserByUserId(String username) throws Exception {

        return Optional.ofNullable(userRepository.findByUserId(username).orElseThrow(() -> new Exception("회원이 존재하지 않습니다."))).get();
    }

    @Transactional
    public void updateUser(UserUpdateRequest user) {

        userRepository.findByUserId(user.getUserId()).get().updateUser(user);
    }

    public Boolean userNickNameEmptyCheck(UserUpdateRequest user){

        if(userRepository.findByUserNickName(user.getUserNickname()).isPresent()){
            return false;
        }
        return true;
    }

    public Boolean userSignupAdminCheck(PrincipalDetails request){

        return  shopRepository.findByUserId(request.getUser().getId()).isPresent();
    }

    public UserAdminUpdateResponse userAdminUpdate(PrincipalDetails request){

        return userRepositoryImpl.findbyShopUpdate(request.getUser().getId());
    }

    public String findUserId(String email) {

        Optional<User> findUser = userRepository.findByUserEmail(email);

        if(findUser.isPresent()){
            return findUser.get().getUserId();
        }else{
            return null;
        }
    }

    public Long findUserByEamilAndId(String email, String userId) {

        Optional<User> findUser = userRepository.findByUserEmailAndUserId(email, userId);

        if(findUser.isPresent()){
            return findUser.get().getId();
        }else{
            return null;
        }
    }

    @Transactional
    public Long changePassword(Long id, String password) {

        Optional<User> findUser = userRepository.findById(id);

        if(!findUser.isPresent()){
            return 0L;
        }else{
            findUser.get().updatePassword(passwordEncoder.encode(password));
            return findUser.get().getId();
        }
    }
}

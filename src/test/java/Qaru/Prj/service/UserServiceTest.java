package Qaru.Prj.service;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.Image;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.RoleType;
import Qaru.Prj.domain.enums.UserType;
import Qaru.Prj.domain.request.UserUpdateRequest;
import Qaru.Prj.repository.ShopRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@Slf4j
class UserServiceTest {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ShopRepository shopRepository;

    CreateClass create = new CreateClass();
    @Test
    void 유저회원가입() {

        // given
        User user = create.createUser();

        // then
        userRepository.save(user);

        // when
        Assertions.assertThat(user.getUserId()).isEqualTo(userRepository.findById(user.getId()).get().getUserId());
    }

    @Test
    void 유저아이디중복확인() {

        // given
        User user = create.createUser();

        // then
        userRepository.save(user);
        Optional<User> byUserid = userRepository.findByUserId(user.getUserId());
        log.info("===============> " + byUserid.get().getUserId());
        // when
        Assertions.assertThat(byUserid.get().getUserId()).isEqualTo(user.getUserId());
    }

    @Test
    void 유저닉네임중복확인() {

        // given
        User user = create.createUser();

        // then
        userRepository.save(user);
        Optional<User> byUserNickname = userRepository.findByUserNickName(user.getUserNickName());

        // when
        Assertions.assertThat(byUserNickname.get().getUserNickName()).isEqualTo(user.getUserNickName());
    }

    @Test
    void 유저이메일중복확인() {

        // given
        User user = create.createUser();

        // then
        userRepository.save(user);
        Optional<User> byUserEmail = userRepository.findByUserEmail(user.getUserEmail());

        // when
        Assertions.assertThat(byUserEmail.get().getUserEmail()).isEqualTo(user.getUserEmail());
    }

    @Test
    void 유저정보수정() {

        // given
        User user = create.createUser();

        // then
        userRepository.save(user);
        String updateNickName = "updateNickname";
        UserUpdateRequest request = new UserUpdateRequest("00011", "test44@naver.com",
                updateNickName, "updateEmail", "city", "street");
        user.updateUser(request);

        // when
        Assertions.assertThat(user.getUserNickName()).isEqualTo(updateNickName);

    }

    @Test
    void 유저어드민가입여부확인() {
        // given
        User user = create.createUser();
        ImageGroup imageGroup = create.createImgGroup();
        Shop shop = create.createShop(user, imageGroup);

        // then
        userRepository.save(user);
        shopRepository.save(shop);

        // when
        Assertions.assertThat(shop.getShopName()).isEqualTo(shopRepository.findByUserId(user.getId()).get().getShopName());
    }
}

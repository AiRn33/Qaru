package Qaru.Prj.service;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.UserType;
import Qaru.Prj.domain.enums.RoleType;
import Qaru.Prj.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import javax.transaction.Transactional;

@SpringBootTest
@Slf4j
@Transactional
class UserServiceTest {

    @Autowired
    private UserRepository userRepository;
    @Test
    @Commit
    public void test(){

        log.info("================================================");
        log.info("date : " + new DateTime().createTime().getCreateDate() + "-" + new DateTime().createTime().getUpdateDate());
        User user = User.builder()
                .userId("test")
                .userPw("1234")
                .userNickName("nickname")
                .userEmail("test@naver.com")
                .dateTime(new DateTime().createTime())
                .role(RoleType.USER)
                .userSocialType(UserType.NOMAL)
                .address(new Address("서울특별시", "가산동 238-59 세움아트빌 203호", "000-000"))
                .build();

        userRepository.save(user);
    }
}
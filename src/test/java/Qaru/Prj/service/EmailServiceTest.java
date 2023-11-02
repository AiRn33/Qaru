package Qaru.Prj.service;

import Qaru.Prj.email.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@Slf4j
class EmailServiceTest {

    @Autowired
    private EmailService emailService;
    @Autowired
    private RedisUtil redisUtil;

    @Test
    void 이메일유효체크(){

        String testEmail = "test33@naver.com";
        String code = emailService.sendRedis(testEmail);

        Assertions.assertThat(redisUtil.getData(code)).isEqualTo(testEmail);
        try{
            // 70초 경과
            Thread.sleep(70000);
        }catch(Exception e){
            e.printStackTrace();
        }
        assertNull(redisUtil.getData(code));
    }


}
package Qaru.Prj.service;

import Qaru.Prj.email.RedisUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {

    private final JavaMailSender mailSender;
    private final RedisUtil redisUtil;
    private static String code = "";
    @Async
    public void sendMail(String email) throws UnsupportedEncodingException, MessagingException {
        sendRedis(email);
        MimeMessage message = mailSender.createMimeMessage();
        message.addRecipients(Message.RecipientType.TO, email);
        message.setSubject("Qaru의 회원가입을 축하드립니다");
        String text = "";
        text+= "<div style='margin:100px;'>";
        text+= "<div style='border:1px solid black; font-family:verdana';>";
        text+= "<h3 style='color:blue;'>Qaru 회원가입 인증번호입니다.</h3>";
        text+= "인증 번호는 3분간 유효합니다.";
        text+= "<div style='font-size:130%'>";
        text+= "인증번호 :  " + code;
        text+= "</div>";
        message.setText(text, "utf-8", "html");
        message.setFrom(new InternetAddress("tkdqhr6777@naver.com", "Qaru"));
        mailSender.send(message);
    }

    public String sendRedis(String email) {
        code = "";
        try {
            code = createCode();
            // 60 * 1L = 1분
            redisUtil.setDataExpire(code, email, 60 * 1L);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return code;
    }

    private String createCode() {
        String code = RandomStringUtils.randomNumeric(6);
        boolean codeCheck = true;
        while(codeCheck){
            if(!StringUtils.hasText(redisUtil.getData(code))){
                // 현재 해당 코드 등록되지 않은 경우
                codeCheck = false;
            }else{
                // 코드 등록된 경우 새로운 난수 코드 발행
                code = RandomStringUtils.randomNumeric(6);
            }
        }
        return code;
    }
}
package Qaru.Prj.service;

import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

@Service
@RequiredArgsConstructor
public class EmailService {
    private final JavaMailSender mailSender;

    @Async
    public void sendMail(String email) throws UnsupportedEncodingException, MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        message.addRecipients(Message.RecipientType.TO, email);
        message.setSubject("Qaru의 회원가입을 축하드립니다");
        String text = "";
        text+= "<div style='margin:100px;'>";
        text+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
        text+= "<h3 style='color:blue;'>Qaru 회원가입 인증 링크 입니다.</h3>";
        text+= "<div style='font-size:130%'>";
        text+= "<a href='http://localhost:8080/'>인증 하기!</a>";
        text+= "</div>";
        message.setText(text, "utf-8", "html");
        message.setFrom(new InternetAddress("tkdqhr6777@naver.com", "Qaru"));
        mailSender.send(message);
    }

}
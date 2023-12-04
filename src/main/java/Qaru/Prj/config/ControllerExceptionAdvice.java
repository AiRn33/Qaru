package Qaru.Prj.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.persistence.NonUniqueResultException;
import java.util.NoSuchElementException;

@ControllerAdvice
@Slf4j
public class ControllerExceptionAdvice {

    @ExceptionHandler(NonUniqueResultException.class)
    public String errorException(Model model, Exception e) {
        log.info("=======> " + e.getMessage());
        e.printStackTrace();
        model.addAttribute("exception", "알 수 없는 에러가 발생하였습니다.");
        return "/error";
    }

    @ExceptionHandler(NoSuchElementException.class)
    public String errorNoSuchException(Model model, Exception e) {
        log.info("=======> " + e.getMessage());
        e.printStackTrace();
        model.addAttribute("exception", "알 수 없는 에러가 발생하였습니다.");
        return "/error";
    }

    @ExceptionHandler(Exception.class)
    public String AllException(Model model, Exception e) {
        log.info("=======> " + e.getMessage());
        e.printStackTrace();
        model.addAttribute("exception", "알 수 없는 에러가 발생하였습니다.");
        return "/error";
    }

}

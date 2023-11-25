package Qaru.Prj.domain.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Getter
@Setter
@ToString
public class UserAuthRequest {

    @Size(min = 6, max = 6, message = "인증번호를 다시 입력해주세요.")
    private String authNum;
    private String email;
    private String userId;
    private String userPw;
    private String userNickname;
    private String userEmail;

}

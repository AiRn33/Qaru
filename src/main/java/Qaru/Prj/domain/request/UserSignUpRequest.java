package Qaru.Prj.domain.request;

import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.RoleType;
import Qaru.Prj.domain.enums.UserType;
import lombok.*;

import javax.validation.constraints.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class UserSignUpRequest {

    @NotBlank(message = "아이디를 입력해주세요.")
    @Size(min = 6, max = 15, message = "아이디는 6 ~ 15글자까지 입력가능합니다.")
    private String userId;

    @NotBlank(message = "패스워드를 입력해주세요.")
    @Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*\\W)(?=\\S+$).{6,15}",
            message = "비밀번호는 영문자와 숫자/특수기호가 적어도 1개 이상 포함된 6 ~ 15글자까지의 비밀번호여야 합니다.")
    private String userPw;
    private String userPwCk;

    @NotBlank(message = "닉네임을 입력해주세요.")
    @Size(min = 2, max = 15, message = "닉네임은 2 ~ 15글자까지 입력가능합니다.")
    private String userNickname;

    @NotBlank(message = "이메일을 입력해주세요.")
    @Email(message = "이메일 형식에 맞지 않습니다.")
    private String userEmail;

    public UserSignUpRequest(String userId, String userPw, String userPwCk, String userNickname, String userEmail) {
        this.userId = userId;
        this.userPw = userPw;
        this.userPwCk = userPwCk;
        this.userNickname = userNickname;
        this.userEmail = userEmail;
    }

    public UserSignUpRequest(UserAuthRequest request){
        this.userId = request.getUserId();
        this.userPw = request.getUserPw();
        this.userNickname = request.getUserNickname();
        this.userEmail = request.getUserEmail();
    }

    public User toEntity(){
        return User.builder()
                .userId(userId)
                .userPw(userPw)
                .userNickName(userNickname)
                .userEmail(userEmail)
                .dateTime(new DateTime().createTime())
                .role(RoleType.USER)
                .userSocialType(UserType.NOMAL)
                .build();
    }

}

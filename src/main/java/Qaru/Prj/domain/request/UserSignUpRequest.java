package Qaru.Prj.domain.request;

import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.RoleType;
import Qaru.Prj.domain.enums.UserType;
import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class UserSignUpRequest {

    @NotEmpty(message = "아이디를 입력해주세요.")
    private String userId;

    @NotEmpty(message = "패스워드를 입력해주세요.")
    private String userPw;
    private String userPwCk;

    @NotEmpty(message = "닉네임을 입력해주세요.")
    private String userNickname;

    @NotEmpty(message = "이메일을 입력해주세요.")
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

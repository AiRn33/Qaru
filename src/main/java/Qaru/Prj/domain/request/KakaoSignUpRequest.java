package Qaru.Prj.domain.request;

import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.RoleType;
import Qaru.Prj.domain.enums.UserType;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class KakaoSignUpRequest {

    private String kakaoId;

    private String userId;

    private String userPw;


    @NotBlank(message = "닉네임을 입력해주세요.")
    @Size(min = 2, max = 15, message = "닉네임은 2 ~ 15글자까지 입력가능합니다.")
    private String userNickname;

    @NotBlank(message = "이메일을 입력해주세요.")
    @Email(message = "이메일 형식에 맞지 않습니다.")
    private String userEmail;

    private UserType socialType;

    public KakaoSignUpRequest(String kakaoId, String userNickname, String userEmail) {
        this.kakaoId = kakaoId;
        this.userNickname = userNickname;
        this.userEmail = userEmail;
    }


    public void setEmailAlram(){
        this.userId = kakaoId + "_kakao";
        this.userPw = "kakao_1230";
        this.socialType = UserType.KAKAO;
    }

    public User toEntity(){
        return User.builder()
                .userId(kakaoId)
                .userNickName(userNickname)
                .userEmail(userEmail)
                .dateTime(new DateTime().createTime())
                .role(RoleType.USER)
                .userSocialType(UserType.KAKAO)
                .build();
    }

}

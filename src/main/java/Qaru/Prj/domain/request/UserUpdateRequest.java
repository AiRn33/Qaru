package Qaru.Prj.domain.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@ToString
public class UserUpdateRequest {

    private String userZipcode;

    private String userId;

    @NotBlank(message = "닉네임을 입력해주세요.")
    private String userNickname;

    private String userEmail;

    @NotBlank(message = "주소를 입력해주세요.")
    private String userCity;

    @NotBlank(message = "상세 주소를 입력해주세요.")
    private String userStreet;
}

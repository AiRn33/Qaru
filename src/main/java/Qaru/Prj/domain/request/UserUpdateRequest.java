package Qaru.Prj.domain.request;

import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserUpdateRequest {

    private String userZipcode;

    private String userId;

    @NotBlank(message = "닉네임을 입력해주세요.")
    @Size(min = 2, max = 15, message = "닉네임은 2 ~ 15글자까지 입력가능합니다.")
    private String userNickname;

    private String userEmail;

    @NotBlank(message = "주소를 입력해주세요.")
    private String userCity;

    @NotBlank(message = "상세 주소를 입력해주세요.")
    private String userStreet;
}

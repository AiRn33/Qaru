package Qaru.Prj.domain.request;

import Qaru.Prj.domain.baseEntity.Address;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@ToString
public class UserAdminChangeRequest {

    private String shopTitle;

    private String shopComment;

    @NotBlank(message = "주소를 입력해주세요.")
    private String userCity;

    @NotBlank(message = "상세 주소를 입력해주세요.")
    private String userStreet;

    private String userZipcode;

    private MultipartFile file;
}

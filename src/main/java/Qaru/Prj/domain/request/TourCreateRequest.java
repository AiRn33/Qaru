package Qaru.Prj.domain.request;

import Qaru.Prj.domain.baseEntity.Address;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import java.util.List;

@Getter
@Setter
@ToString
public class TourCreateRequest {

    @NotBlank(message = "여행 타이틀을 입력해주세요.")
    private String tourTitle;

    @NotBlank(message = "여행 내용을 입력해주세요.")
    private String tourContent;

    private List<MultipartFile> file;

    @NotBlank(message = "주소를 입력해주세요.")
    private String city;

    @NotBlank(message = "상세 주소를 입력해주세요.")
    private String street;

    private String zipcode;
}

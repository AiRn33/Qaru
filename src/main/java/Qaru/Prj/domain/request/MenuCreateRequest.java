package Qaru.Prj.domain.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@Getter
@Setter
@ToString
public class MenuCreateRequest {

    private String menuName;
    private String menuComment;
    private String menuPrice;
    private String imageGroupId;
    private String menuViewCheck;
}

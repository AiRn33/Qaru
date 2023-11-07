package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class UserAdminUpdateResponse {


    private User user;
    private String shopName;
    private String shopComment;
    private String userCity;
    private String userStreet;
    private String userZipcode;
    private ImageGroup imageGroup;
    private String originalFileName;
    private String storedFileName;
    private String storedFilePath;

}

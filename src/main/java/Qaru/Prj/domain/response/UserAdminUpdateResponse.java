package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.ImageGroup;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserAdminUpdateResponse {


    private Long user_id;
    private String shopName;
    private String shopComment;
    private String city;
    private String street;
    private String zipcode;
    private Long image_group_id;
    private ImageGroup imageGroup;
    private Long original_file_name;
    private Long stored_file_name;
    private Long stored_file_path;
}

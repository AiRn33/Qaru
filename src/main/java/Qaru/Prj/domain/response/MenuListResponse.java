package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.Image;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class MenuListResponse {

    private Long menuId;
    private String menuName;
    private String menuComment;
    private Long menuPrice;
    private Long imageGroupId;
    private String storedFilePath;
    private String storedFileName;
}

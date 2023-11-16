package Qaru.Prj.domain.request;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@ToString
public class ShopUpdateRequest {

    @NotBlank(message = "가게 이름을 입력해주세요.")
    private String shopName;

    @NotBlank(message = "가게 설명을 입력해주세요.")
    private String shopComment;

    @NotBlank(message = "가게 종류를 입력해주세요.")
    private String shopType;

    @NotBlank(message = "주소를 입력해주세요.")
    private String userCity;

    @NotBlank(message = "상세 주소를 입력해주세요.")
    private String userStreet;

    private String userZipcode;

    private MultipartFile file;

    private Boolean imageUpdateCheck;

    private String storedFileName;

    public Shop toEntity(User user, ImageGroup imageGroup){
        return Shop.builder()
                .user(user)
                .imageGroup(imageGroup)
                .address(new Address(userCity, userStreet, userZipcode))
                .dateTime(new DateTime().createTime())
                .shopName(shopName)
                .shopComment(shopComment)
                .shopType(shopType)
                .build();
    }
}

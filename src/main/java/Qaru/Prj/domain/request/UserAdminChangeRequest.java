package Qaru.Prj.domain.request;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.ShopOpen;
import Qaru.Prj.domain.entity.User;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
public class UserAdminChangeRequest {

    @NotBlank(message = "가게 이름을 입력해주세요.")
    private String shopName;

    @NotBlank(message = "가게 설명을 입력해주세요.")
    private String shopComment;

    @NotBlank(message = "주소를 입력해주세요.")
    private String userCity;

    @NotBlank(message = "가게 종류를 입력해주세요.")
    private String shopType;

    @NotBlank(message = "상세 주소를 입력해주세요.")
    private String userStreet;

    private String userZipcode;

    private MultipartFile file;

    private Boolean mon;

    private Boolean tues;

    private Boolean wed;

    private Boolean thur;

    private Boolean fri;

    private Boolean sat;

    private Boolean sun;

    private String openTime;

    private String openMinute;

    private String closeTime;
    private String closeMinute;


    private String reservationOpenTime;

    private String reservationOpenMinute;

    private String reservationCloseTime;
    private String reservationCloseMinute;
    private Long reservationTime;

    @NotNull(message = "예약당 최대 인원을 입력하지 않았습니다.")
    private Long reservationLimitNum;

    @NotNull(message = "시간당 최대 팀을 입력하지 않았습니다.")
    private Long reservationLimitTeam;

    private Boolean reservationCheck;

    public Shop toEntity(User user, ImageGroup imageGroup){
        return Shop.builder()
                .user(user)
                .imageGroup(imageGroup)
                .address(new Address(userCity, userStreet, userZipcode))
                .dateTime(new DateTime().createTime())
                .shopName(shopName)
                .shopComment(shopComment)
                .shopType(shopType)
                .reservationCheck(reservationCheck)
                .build();
    }

}

package Qaru.Prj.domain.response;

import lombok.*;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class ShopListResponse {

    private Long shopId;

    private String shopName;

    private String shopComment;

    private String shopType;

    private String shopCity;

    private String shopStreet;

    private Boolean menuView;

    private String storedFileName;

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

    private Boolean reservationCheck;
//
//    private String reservationOpenTime;
//    private String reservationOpenMinute;
//    private String reservationCloseTime;
//    private String reservationCloseMinute;
//    private Long reservationTime;
//
//    private Long reservationLimitNum;
//
//    private Long reservationLimitTeam;

    public ShopListResponse shopOpenTimeSet(){

        String openTimes = this.openTime;
        String closeTimes = this.closeTime;

        this.openTime = openTimes.split("-")[0];
        this.openMinute = openTimes.split("-")[1];
        this.closeTime = closeTimes.split("-")[0];
        this.closeMinute = closeTimes.split("-")[1];

        return this;
    }

}

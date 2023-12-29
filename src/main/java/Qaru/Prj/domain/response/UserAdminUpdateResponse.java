package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;

@Getter
@Setter
public class UserAdminUpdateResponse {

    private User user;
    private String shopName;
    private String shopComment;
    private String shopType;
    private String userCity;
    private String userStreet;
    private String userZipcode;
    private ImageGroup imageGroup;
    private String originalFileName;
    private String storedFileName;
    private String storedFilePath;
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

    private Long reservationLimitNum;

    private Long reservationLimitTeam;

    private Boolean reservationCheck;

    public UserAdminUpdateResponse shopOpenTimeSet(){
        String openTimes = this.openTime;
        String closeTimes = this.closeTime;
        String reservationOpenTimes = this.reservationOpenTime;
        String reservationCloseTimes = this.reservationCloseTime;
        this.openTime = openTimes.split("-")[0];
        this.openMinute = openTimes.split("-")[1];
        this.closeTime = closeTimes.split("-")[0];
        this.closeMinute = closeTimes.split("-")[1];
        this.reservationOpenTime = reservationOpenTimes.split("-")[0];
        this.reservationOpenMinute = reservationOpenTimes.split("-")[1];
        this.reservationCloseTime = reservationCloseTimes.split("-")[0];
        this.reservationCloseMinute = reservationCloseTimes.split("-")[1];
        return this;
    }
}

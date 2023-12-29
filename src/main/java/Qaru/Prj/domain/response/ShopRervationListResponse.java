package Qaru.Prj.domain.response;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@Setter
public class ShopRervationListResponse {

    private Long shopId;

    private LocalDateTime reservationDate;

    private Boolean mon;

    private Boolean tues;

    private Boolean wed;

    private Boolean thur;

    private Boolean fri;

    private Boolean sat;

    private Boolean sun;

    private Long reservationId;

    private String openTime;

    private String openMinute;

    private String closeTime;
    private String closeMinute;

    private String reservationOpenTime;
    private String reservationOpenMinute;
    private String reservationCloseTime;
    private String reservationCloseMinute;
    private Long reservationTime;

    public ShopRervationListResponse shopOpenTimeSet(){

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

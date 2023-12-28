package Qaru.Prj.domain.response;

import lombok.*;

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

    public ShopListResponse shopOpenTimeSet(){
        String openTimes = this.openTime;
        String closeTimes = this.closeTime;
        System.out.println("========= > : " + openTimes);
        System.out.println("========= > : " + openTimes.split("-")[0]);
        System.out.println("========= > : " + openTimes.split("-")[1]);

        this.openTime = openTimes.split("-")[0];
        this.openMinute = openTimes.split("-")[1];
        this.closeTime = closeTimes.split("-")[0];
        this.closeMinute = closeTimes.split("-")[1];
        return this;
    }
}

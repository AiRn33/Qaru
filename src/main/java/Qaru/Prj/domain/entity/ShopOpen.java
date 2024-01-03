package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.request.ShopUpdateRequest;
import Qaru.Prj.domain.request.UserAdminChangeRequest;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Getter
@DynamicUpdate //변경된 필드만 적용
public class ShopOpen {

    @Id
    @GeneratedValue
    @Column(name = "shop_open_id")
    private Long id;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "shop_id")
    private Shop shop;

    private Boolean mon;

    private Boolean tues;

    private Boolean wed;

    private Boolean thur;

    private Boolean fri;

    private Boolean sat;

    private Boolean sun;

    private String openTime;

    private String closeTime;

    private String reservationOpen;

    private String reservationClose;

    private Long reservationTime;

    private Long reservationLimitNum;

    private Long reservationLimitTeam;

    public ShopOpen updateShopOpen(ShopUpdateRequest request, Shop shop) {
        this.shop = shop;
        this.mon = request.getMon();
        this.tues = request.getTues();
        this.wed = request.getWed();
        this.thur = request.getThur();
        this.fri = request.getFri();
        this.sat = request.getSat();
        this.sun = request.getSun();
        this.openTime = plusZero(request.getOpenTime()) + "-" + plusZero(request.getOpenMinute());
        this.closeTime = plusZero(request.getCloseTime()) + "-" + plusZero(request.getCloseMinute());
        this.reservationOpen = plusZero(request.getReservationOpenTime()) + "-" + plusZero(request.getReservationOpenMinute());
        this.reservationClose = plusZero(request.getReservationCloseTime())+ "-" + plusZero(request.getReservationCloseMinute());
        this.reservationTime = request.getReservationTime();
        this.reservationLimitNum = request.getReservationLimitNum();
        this.reservationLimitTeam = request.getReservationLimitTeam();

        return this;
    }

    public String plusZero(String time){
        return time.length() == 1 ? "0" + time : time;
    }

    public ShopOpen createShopOpen(UserAdminChangeRequest request, Shop shop){
        this.shop = shop;
        this.mon = request.getMon();
        this.tues = request.getTues();
        this.wed = request.getWed();
        this.thur = request.getThur();
        this.fri = request.getFri();
        this.sat = request.getSat();
        this.sun = request.getSun();
        this.openTime = plusZero(request.getOpenTime()) + "-" + plusZero(request.getOpenMinute());
        this.closeTime = plusZero(request.getCloseTime()) + "-" + plusZero(request.getCloseMinute());
        this.reservationOpen = plusZero(request.getReservationOpenTime()) + "-" + plusZero(request.getReservationOpenMinute());
        this.reservationClose = plusZero(request.getReservationCloseTime())+ "-" + plusZero(request.getReservationCloseMinute());
        this.reservationTime = request.getReservationTime();
        this.reservationLimitNum = request.getReservationLimitNum();
        this.reservationLimitTeam = request.getReservationLimitTeam();
        return this;
    }
}

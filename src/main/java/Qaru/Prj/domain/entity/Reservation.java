package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.enums.ReservationType;
import Qaru.Prj.domain.enums.StatusType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Getter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
public class Reservation {

    @Id
    @GeneratedValue
    @Column(name = "reservation_id")
    private Long id;


    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "shop_id")
    private Shop shop;


    @Column(name = "reservation_time")
    private LocalDateTime reservationTime;

    @Column(name = "reservation_name")
    private String reservationName;

    @Column(name = "reservation_phone")
    private String reservationPhone;

    @Column(name = "reservation_num")
    private Long reservationNum;

    @Column(name = "reservation_message")
    private String reservationMessage;

    @Column(name = "reservation_type")
    @Enumerated(EnumType.STRING)
    private ReservationType type;

    @Builder
    public Reservation(Long id, User user, Shop shop, LocalDateTime reservationTime,
                       String reservationName, String reservationPhone,
                       Long reservationNum, String reservationMessage, ReservationType type) {
        this.id = id;
        this.user = user;
        this.shop = shop;
        this.reservationTime = reservationTime;
        this.reservationName = reservationName;
        this.reservationPhone = reservationPhone;
        this.reservationNum = reservationNum;
        this.reservationMessage = reservationMessage;
        this.type = type;
    }

    public Reservation() {

    }

    public Reservation reservationCancalChange(String type){

        if(type.equals("cencel")){
            this.type = ReservationType.CANCEL;
        }else if(type.equals("approve")){
            this.type = ReservationType.APPROVE;
        }else if(type.equals("refuse")){
            this.type = ReservationType.REFUSE;
        }else if(type.equals("wait")){
            this.type = ReservationType.WAIT;
        }
        return this;
    }

    public Reservation reservationMsgChange(String msg){
        this.reservationMessage = msg;
        return this;
    }

}

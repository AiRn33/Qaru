package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.enums.ReservationType;
import Qaru.Prj.domain.enums.StatusType;
import com.fasterxml.jackson.annotation.JsonIgnore;
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


    @JoinColumn(name = "reservation_time")
    private LocalDateTime reservationTime;

    @JoinColumn(name = "reservation_name")
    private String reservationName;

    @JoinColumn(name = "reservation_phone")
    private String reservationPhone;

    @JoinColumn(name = "reservation_num")
    private Long reservationNum;

    @JoinColumn(name = "reservation_message")
    private String reservationMessage;

    @JoinColumn(name = "reservation_type")
    @Enumerated(EnumType.STRING)
    private ReservationType type;
}

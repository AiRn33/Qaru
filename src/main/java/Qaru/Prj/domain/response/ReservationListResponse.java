package Qaru.Prj.domain.response;

import Qaru.Prj.domain.enums.ReservationType;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
@ToString
public class ReservationListResponse {

    private Long reservationId;

    private String shopName;

    private String reservationName;

    private String reservationPhone;

    private Long reservationNum;

    private ReservationType reservationType;

    private String reservationMessage;

    private LocalDateTime reservationTime;

    private String reservationTimes;

}

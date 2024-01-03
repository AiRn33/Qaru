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

    public ReservationListResponse setTime(){
        LocalDateTime time = this.reservationTime;
        this.reservationTimes = time.format(
                DateTimeFormatter.ofPattern("yyyy년MM월dd일 HH시mm분")
        );
        return this;
    }

}

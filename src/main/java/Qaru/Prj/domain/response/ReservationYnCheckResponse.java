package Qaru.Prj.domain.response;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ReservationYnCheckResponse {

    private LocalDateTime reservationTime;

    private Long hour;
    private Long minute;

    public ReservationYnCheckResponse setTimes(){

        this.hour = (long) this.reservationTime.getHour();
        this.minute = (long) this.reservationTime.getMinute();

        return this;
    }
}

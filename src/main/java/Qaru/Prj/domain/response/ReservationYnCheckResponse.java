package Qaru.Prj.domain.response;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ReservationYnCheckResponse {

    private LocalDateTime reservationTime;

   private String reservationTimes;

   private Long count;
    public ReservationYnCheckResponse setTimes(){

        this.reservationTimes = String.valueOf(reservationTime.getYear()) + reservationTime.getMonth() + reservationTime.getDayOfMonth();
        return this;
    }
}

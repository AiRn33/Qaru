package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.Reservation;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationDataResponse {


    private String selectDate;
    private String reservationTime;
    private String reservationName;
    private String reservationLimitNum;
    private String reservationPhone;

    public ReservationDataResponse responseSet(Reservation reservation){

        String date = reservation.getReservationTime().getYear() + "년 "
                        + reservation.getReservationTime().getHour() + "시 "
                        + reservation.getReservationTime().getMinute() + "분";

        this.selectDate = date;
        this.reservationName = reservation.getReservationName();
        this.reservationPhone = reservation.getReservationPhone();
        this.reservationLimitNum = String.valueOf(reservation.getReservationNum());
        return this;
    }

}

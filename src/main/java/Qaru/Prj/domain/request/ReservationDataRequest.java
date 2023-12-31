package Qaru.Prj.domain.request;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.Reservation;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.ReservationType;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
public class ReservationDataRequest {

    private String selectDate;
    private String reservationTime;
    private String reservationName;
    private String reservationLimitNum;
    private String reservationPhone;

    public Reservation toEntity(ReservationDataRequest request, User user, Shop shop) {

        String[] dateArr = request.getSelectDate().split("-");
        String timeArr[] = request.getReservationTime().split("-");
        LocalDateTime reservationDateTime = LocalDateTime.of(
                Integer.parseInt(dateArr[0]),
                Integer.parseInt(dateArr[1]),
                Integer.parseInt(dateArr[2]),
                Integer.parseInt(timeArr[0]),
                Integer.parseInt(timeArr[1]));

        return Reservation.builder()
                .reservationMessage("")
                .reservationNum(Long.valueOf(request.getReservationLimitNum()))
                .reservationName(request.getReservationName())
                .reservationTime(reservationDateTime)
                .reservationPhone(request.reservationPhone)
                .type(ReservationType.WAIT)
                .user(user)
                .shop(shop)
                .build();
    }
}

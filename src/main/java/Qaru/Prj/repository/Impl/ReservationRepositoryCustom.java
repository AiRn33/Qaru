package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.response.ReservationListResponse;
import Qaru.Prj.domain.response.ReservationYnCheckResponse;
import Qaru.Prj.domain.response.ShopRervationListResponse;

import java.util.List;

public interface ReservationRepositoryCustom {

    ShopRervationListResponse searchReservation(Long shopId, String date);

    List<ReservationYnCheckResponse> reservationCheck(Long shopId, String date);

    List<ReservationListResponse> myReservationList(Long userId);
}

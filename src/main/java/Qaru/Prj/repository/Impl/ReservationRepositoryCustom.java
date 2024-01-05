package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.response.ReservationAreaList;
import Qaru.Prj.domain.response.ReservationListResponse;
import Qaru.Prj.domain.response.ReservationYnCheckResponse;
import Qaru.Prj.domain.response.ShopRervationListResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ReservationRepositoryCustom {

    ShopRervationListResponse searchReservation(Long shopId, String date);

    List<ReservationYnCheckResponse> reservationCheck(Long shopId, String date);

    List<ReservationListResponse> myReservationList(Long userId);

    List<ReservationListResponse> shopReservationList(Long shopId);

    Page<ReservationListResponse> reservationAllList(Long shopId, Pageable pageable, String startDate, String endDate);

    Long reservationSearchPageCount(Long shopId, String startDate, String endDate);

    List<ReservationAreaList> reservationAreaList(Long shopId);
}

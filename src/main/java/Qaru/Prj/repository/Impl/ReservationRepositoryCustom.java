package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.response.ShopRervationListResponse;

import java.util.List;

public interface ReservationRepositoryCustom {

    List<ShopRervationListResponse> searchReservation(Long shopId, String date);
}

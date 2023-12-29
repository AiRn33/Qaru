package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.QReservation;
import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.domain.response.ShopRervationListResponse;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

import static Qaru.Prj.domain.entity.QImage.image;
import static Qaru.Prj.domain.entity.QImageGroup.imageGroup;
import static Qaru.Prj.domain.entity.QReservation.reservation;
import static Qaru.Prj.domain.entity.QShop.shop;
import static Qaru.Prj.domain.entity.QShopOpen.shopOpen;
import static Qaru.Prj.domain.entity.QUser.user;

@RequiredArgsConstructor
@Repository
public class ReservationRepositoryImpl implements ReservationRepositoryCustom {

    private final JPAQueryFactory queryFactory;


    @Override
    public ShopRervationListResponse searchReservation(Long shopId, String date) {

        return queryFactory
                .select(Projections.fields(ShopRervationListResponse.class,
                        shopOpen.mon,
                        shopOpen.tues,
                        shopOpen.wed,
                        shopOpen.thur,
                        shopOpen.fri,
                        shopOpen.sat,
                        shopOpen.sun,
                        shopOpen.openTime,
                        shopOpen.closeTime,
                        shopOpen.reservationOpen.as("reservationOpenTime"),
                        shopOpen.reservationClose.as("reservationCloseTime"),
                        shopOpen.reservationTime,
                        shopOpen.reservationLimitNum,
                        shopOpen.reservationLimitTeam
                ))
                .from(shopOpen)
                .where(shop.id.eq(shopId))
                .fetchOne();
    }
}

package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.QMenu;
import Qaru.Prj.domain.entity.QOrder;
import Qaru.Prj.domain.entity.QReservation;
import Qaru.Prj.domain.enums.ReservationType;
import Qaru.Prj.domain.response.*;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.ConstantImpl;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.DateTemplate;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.StringTemplate;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

import static Qaru.Prj.domain.entity.QImage.image;
import static Qaru.Prj.domain.entity.QImageGroup.imageGroup;
import static Qaru.Prj.domain.entity.QMenu.menu;
import static Qaru.Prj.domain.entity.QOrder.order;
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

    @Override
    public List<ReservationYnCheckResponse> reservationCheck(Long shopId, String date) {

        LocalDateTime selectDateStart = LocalDateTime.of(Integer.parseInt(date.split("-")[0]), Integer.parseInt(date.split("-")[1]), Integer.parseInt(date.split("-")[2]), 00, 00);
        LocalDateTime selectDateEnd = LocalDateTime.of(Integer.parseInt(date.split("-")[0]), Integer.parseInt(date.split("-")[1]), Integer.parseInt(date.split("-")[2]), 23, 59);

        return queryFactory
                .select(Projections.fields(ReservationYnCheckResponse.class,
                        reservation.reservationTime,
                        reservation.count().as("count")
                ))
                .from(reservation).
                innerJoin(shop).on(reservation.shop.id.eq(shop.id))
                .groupBy(reservation.reservationTime)
                .orderBy(reservation.reservationTime.asc())
                .where(shop.id.eq(shopId).and(reservation.reservationTime.between(selectDateStart, selectDateEnd))
                        .and(reservation.type.eq(ReservationType.WAIT).or(reservation.type.eq(ReservationType.APPROVE))))
                .fetch();
    }

    @Override
    public List<ReservationListResponse> myReservationList(Long userId) {

        DateTemplate<String> formattedDate = Expressions.dateTemplate(
                String.class
                , "DATE_FORMAT({0}, {1})"
                , reservation.reservationTime
                , ConstantImpl.create("%Y년%m월%d일 %h시%i분"));

        return queryFactory
                .select(Projections.fields(ReservationListResponse.class,
                        shop.shopName.as("shopName"),
                        reservation.id.as("reservationId"),
                        reservation.reservationName.as("reservationName"),
                        reservation.reservationPhone.as("reservationPhone"),
                        reservation.reservationNum.as("reservationNum"),
                        reservation.type.as("reservationType"),
                        reservation.reservationMessage.as("reservationMessage"),
                        reservation.reservationTime.as("reservationTime"),
                        formattedDate.as("reservationTimes")
                ))
                .from(reservation)
                .innerJoin(shop).on(shop.id.eq(reservation.shop.id))
                .where(reservation.user.id.eq(userId))
                .orderBy(reservation.id.desc())
                .fetch();
    }

    @Override
    public List<ReservationListResponse> shopReservationList(Long shopId) {

        DateTemplate<String> formattedDate = Expressions.dateTemplate(
                String.class
                , "DATE_FORMAT({0}, {1})"
                , reservation.reservationTime
                , ConstantImpl.create("%Y년%m월%d일 %h시%i분"));

        return queryFactory
                .select(Projections.fields(ReservationListResponse.class,
                        shop.shopName.as("shopName"),
                        reservation.id.as("reservationId"),
                        reservation.reservationName.as("reservationName"),
                        reservation.reservationPhone.as("reservationPhone"),
                        reservation.reservationNum.as("reservationNum"),
                        reservation.type.as("reservationType"),
                        reservation.reservationMessage.as("reservationMessage"),
                        reservation.reservationTime.as("reservationTime"),
                        formattedDate.as("reservationTimes")
                ))
                .from(reservation)
                .innerJoin(shop).on(shop.id.eq(reservation.shop.id))
                .where(reservation.shop.id.eq(shopId))
                .orderBy(reservation.id.desc())
                .fetch();
    }

    @Override
    public Page<ReservationListResponse> reservationAllList(Long shopId, Pageable pageable, String startDate, String endDate) {

        LocalDateTime selectDateStart = LocalDateTime.of(Integer.parseInt(startDate.split("-")[0]), Integer.parseInt(startDate.split("-")[1]), Integer.parseInt(startDate.split("-")[2]), 00, 00);
        LocalDateTime selectDateEnd = LocalDateTime.of(Integer.parseInt(endDate.split("-")[0]), Integer.parseInt(endDate.split("-")[1]), Integer.parseInt(endDate.split("-")[2]), 23, 59);

        DateTemplate<String> formattedDate = Expressions.dateTemplate(
                String.class
                , "DATE_FORMAT({0}, {1})"
                , reservation.reservationTime
                , ConstantImpl.create("%Y년%m월%d일 %h시%i분"));

        List<ReservationListResponse> shopList = queryFactory	// (1)
                .select(Projections.fields(ReservationListResponse.class,
                        shop.shopName.as("shopName"),
                        reservation.id.as("reservationId"),
                        reservation.reservationName.as("reservationName"),
                        reservation.reservationPhone.as("reservationPhone"),
                        reservation.reservationNum.as("reservationNum"),
                        reservation.type.as("reservationType"),
                        reservation.reservationMessage.as("reservationMessage"),
                        reservation.reservationTime.as("reservationTime"),
                        formattedDate.as("reservationTimes")
                ))
                .from(reservation)
                .innerJoin(shop).on(shop.id.eq(reservation.shop.id))
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .orderBy(reservation.reservationTime.desc())
                .where(shop.id.eq(shopId).and(reservation.reservationTime.between(selectDateStart, selectDateEnd)))
                .fetch();


        return new PageImpl<>(shopList, pageable, shopList.size());
    }

    @Override
    public Long reservationSearchPageCount(Long shopId, String startDate, String endDate) {

        LocalDateTime selectDateStart = LocalDateTime.of(Integer.parseInt(startDate.split("-")[0]), Integer.parseInt(startDate.split("-")[1]), Integer.parseInt(startDate.split("-")[2]), 00, 00);
        LocalDateTime selectDateEnd = LocalDateTime.of(Integer.parseInt(endDate.split("-")[0]), Integer.parseInt(endDate.split("-")[1]), Integer.parseInt(endDate.split("-")[2]), 23, 59);

        Long count = queryFactory
                .select(reservation)
                .from(reservation)
                .where(shop.id.eq(shopId).and(reservation.reservationTime.between(selectDateStart, selectDateEnd)))
                .fetchCount();

        return count;
    }

    @Override
    public List<ReservationAreaList> reservationAreaList(Long shopId) {
        return queryFactory
                .select(Projections.fields(ReservationAreaList.class,
                        reservation.user.address.city.substring(0,2).as("cityName"),
                        reservation.count().as("count")
                ))
                .from(reservation)
                .innerJoin(shop).on(shop.id.eq(reservation.shop.id))
                .where(reservation.shop.id.eq(shopId))
                .groupBy(reservation.user.address.city.substring(0,2))
                .fetch();
    }


}

package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.QOrder;
import Qaru.Prj.domain.entity.QOrderMenu;
import Qaru.Prj.domain.entity.QShop;
import Qaru.Prj.domain.entity.QUser;
import Qaru.Prj.domain.response.OrderMenuCheckResponse;
import Qaru.Prj.domain.response.OrderStatisticsResponse;
import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.domain.response.TourListResponse;
import com.querydsl.core.types.ConstantImpl;
import com.querydsl.core.types.ExpressionUtils;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.DateTemplate;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.StringTemplate;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

import static Qaru.Prj.domain.entity.QComment.comment;
import static Qaru.Prj.domain.entity.QLikes.likes;
import static Qaru.Prj.domain.entity.QMenu.menu;
import static Qaru.Prj.domain.entity.QOrder.*;
import static Qaru.Prj.domain.entity.QOrderMenu.orderMenu;
import static Qaru.Prj.domain.entity.QShop.*;
import static Qaru.Prj.domain.entity.QTour.tour;
import static Qaru.Prj.domain.entity.QUser.*;

@RequiredArgsConstructor
@Repository
public class OrderRepositoryImpl implements OrderRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public Page<OrderStatisticsResponse> searchStatisticsList(Pageable pageable, Long userId, String startDate, String endDate) {

        LocalDateTime startToday = LocalDateTime.of(Integer.parseInt(startDate.split("-")[0]), Integer.parseInt(startDate.split("-")[1]), Integer.parseInt(startDate.split("-")[2]), 0, 0);
        LocalDateTime endToday = LocalDateTime.of(Integer.parseInt(endDate.split("-")[0]), Integer.parseInt(endDate.split("-")[1]), Integer.parseInt(endDate.split("-")[2]), 23, 59);

        List<OrderStatisticsResponse> statisticsList = queryFactory	// (1)
                .select(Projections.fields(OrderStatisticsResponse.class,
                        user.id.as("userId"),
                        user.userNickName.as("userNickName"),
                        orderMenu.orderMenuPrice.as("orderMenuPrice"),
                        orderMenu.orderMenuCount.as("orderMenuCount"),
                        orderMenu.dateTime.createDate.as("createDate"),
                        orderMenu.statusType.as("orderStatus"),
                        orderMenu.id.as("orderMenuId")
                ))
                .from(orderMenu)
                .innerJoin(shop).on(orderMenu.shop.id.eq(shop.id))
                .innerJoin(user).on(shop.user.id.eq(user.id))
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .orderBy(orderMenu.id.desc())
                .where(user.id.eq(userId).and(orderMenu.dateTime.createDate.between(startToday, endToday)))
                .fetch();

        return new PageImpl<>(statisticsList, pageable, statisticsList.size());
    }

    @Override
    public Long searchPageCount(Long userId, String startDate, String endDate) {

        LocalDateTime startToday = LocalDateTime.of(Integer.parseInt(startDate.split("-")[0]), Integer.parseInt(startDate.split("-")[1]), Integer.parseInt(startDate.split("-")[2]), 0, 0);
        LocalDateTime endToday = LocalDateTime.of(Integer.parseInt(endDate.split("-")[0]), Integer.parseInt(endDate.split("-")[1]), Integer.parseInt(endDate.split("-")[2]), 23, 59);

        Long count = queryFactory
                .select(orderMenu)
                .from(orderMenu)
                .where(orderMenu.shop.user.id.eq(userId).and(orderMenu.dateTime.createDate.between(startToday, endToday)))
                .fetchCount();

        return count;
    }

    @Override
    public List<OrderMenuCheckResponse> findByOrderMenuId(Long orderMenuId) {
        return queryFactory.select(Projections.fields(OrderMenuCheckResponse.class,
                        menu.menuName.as("menuName"),
                        order.orderCount.as("menuCount"),
                        orderMenu.id.as("orderMenuId")
                )).from(orderMenu)
                .innerJoin(order).on(order.orderMenu.id.eq(orderMenu.id))
                .leftJoin(menu).on(order.menu.id.eq(menu.id))
                .where(orderMenu.id.eq(orderMenuId))
                .fetch();

    }
}

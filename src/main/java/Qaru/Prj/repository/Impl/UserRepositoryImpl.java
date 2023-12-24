package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.*;
import Qaru.Prj.domain.response.OrdersResponse;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static Qaru.Prj.domain.entity.QImage.*;
import static Qaru.Prj.domain.entity.QImageGroup.*;
import static Qaru.Prj.domain.entity.QMenu.menu;
import static Qaru.Prj.domain.entity.QMenuGroup.menuGroup;
import static Qaru.Prj.domain.entity.QOrder.order;
import static Qaru.Prj.domain.entity.QOrderMenu.orderMenu;
import static Qaru.Prj.domain.entity.QShop.*;
import static Qaru.Prj.domain.entity.QUser.*;

@Repository
@RequiredArgsConstructor
public class UserRepositoryImpl implements UserRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public UserAdminUpdateResponse findbyShopUpdate(Long userId) {

        UserAdminUpdateResponse fetch =

                queryFactory
                        .select(Projections.fields(UserAdminUpdateResponse.class,
                                shop.user,
                                shop.shopName,
                                shop.imageGroup,
                                shop.shopComment,
                                shop.shopType,
                                shop.address.city.as("userCity"),
                                shop.address.street.as("userStreet"),
                                shop.address.zipcode.as("userZipcode"),
                                image.originalFileName,
                                image.storedFileName,
                                image.storedFilePath))
                        .from(shop,image)
                        .innerJoin(shop.imageGroup).on(image.imageGroup.id.eq(shop.imageGroup.id))
                        .where(shop.user.id.eq(userId)).fetchOne();

        return fetch;
    }

    @Override
    public List<OrdersResponse> ordersList(Long userId) {
        return queryFactory
                .select(Projections.fields(OrdersResponse.class,
                        shop.id.as("shopId"),
                        shop.shopName.as("shopName"),
                        menu.menuName.as("menuName"),
                        orderMenu.orderMenuCount.as("orderMenuCount"),
                        orderMenu.orderMenuPrice.as("orderMenuPrice"),
                        orderMenu.statusType.as("statusType"),
                        orderMenu.id.as("orderMenuId"),
                        order.orderCount.as("orderCount"),
                        user.userNickName.as("userNickName")
                        ))
                .from(user)
                .innerJoin(orderMenu).on(user.id.eq(orderMenu.user.id))
                .innerJoin(order).on(orderMenu.id.eq(order.orderMenu.id))
                .leftJoin(menu).on(order.menu.id.eq(menu.id))
                .innerJoin(shop).on(orderMenu.shop.id.eq(shop.id))
                .where(user.id.eq(userId))
                .orderBy(orderMenu.id.desc())
                        .fetch();
    }

    @Override
    public List<OrdersResponse> adminOrdersList(Long userId) {
        return queryFactory
                .select(Projections.fields(OrdersResponse.class,
                        shop.id.as("shopId"),
                        shop.shopName.as("shopName"),
                        menu.menuName.as("menuName"),
                        orderMenu.orderMenuCount.as("orderMenuCount"),
                        orderMenu.orderMenuPrice.as("orderMenuPrice"),
                        orderMenu.statusType.as("statusType"),
                        orderMenu.id.as("orderMenuId"),
                        order.orderCount.as("orderCount"),
                        user.userNickName.as("userNickName")
                ))
                .from(user)
                .innerJoin(orderMenu).on(user.id.eq(orderMenu.user.id))
                .innerJoin(order).on(orderMenu.id.eq(order.orderMenu.id))
                .leftJoin(menu).on(order.menu.id.eq(menu.id))
                .innerJoin(shop).on(orderMenu.shop.id.eq(shop.id))
                .where(shop.user.id.eq(userId))
                .orderBy(orderMenu.id.desc())
                .fetch();
    }

}

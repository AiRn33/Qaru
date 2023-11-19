package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.entity.QShop;
import Qaru.Prj.domain.entity.QUser;
import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.domain.response.TourListResponse;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

import static Qaru.Prj.domain.entity.QComment.comment;
import static Qaru.Prj.domain.entity.QShop.*;
import static Qaru.Prj.domain.entity.QTour.tour;
import static Qaru.Prj.domain.entity.QUser.user;

@RequiredArgsConstructor
@Repository
public class ShopRepositoryImpl implements ShopRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public Page<ShopListResponse> searchPage(Pageable pageable) {

        List<ShopListResponse> shopList = queryFactory	// (1)
                .select(Projections.fields(ShopListResponse.class,
                        shop.id.as("shop_id"),
                        shop.shopName.as("shop_name"),
                        shop.shopComment.as("shop_comment"),
                        shop.shopType.as("shop_type"),
                        shop.address.city.as("shop_city"),
                        shop.address.street.as("shop_street")
                ))
                .from(shop)
                .where(shop.menuCheck.eq(true).and(shop.menuView.eq(true)))
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .orderBy(shop.id.desc())
                .fetch();


        return new PageImpl<>(shopList, pageable, shopList.size());
    }

    @Override
    public Long searchPageCount() {
        Long count = queryFactory
                .select(shop)
                .from(shop)
                .where(shop.menuCheck.eq(true).and(shop.menuView.eq(true)))
                .fetchCount();

        return count;
    }

    @Override
    public List<ShopListResponse> searchData(String type, String content) {
        return null;
    }

    @Override
    public ShopListResponse shopData(Long userId) {
        return queryFactory.select(Projections.fields(ShopListResponse.class,
                shop.id.as("shop_id"),
                shop.shopName.as("shop_name"),
                shop.shopComment.as("shop_comment"),
                shop.shopType.as("shop_type")
                )).from(user)
                .innerJoin(shop).on(shop.user.id.eq(user.id))
                .where(user.id.eq(userId))
                .fetchOne();
    }
}

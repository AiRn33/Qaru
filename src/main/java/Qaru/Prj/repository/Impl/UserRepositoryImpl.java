package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static Qaru.Prj.domain.entity.QImage.*;
import static Qaru.Prj.domain.entity.QImageGroup.*;
import static Qaru.Prj.domain.entity.QShop.*;
import static Qaru.Prj.domain.entity.QUser.*;

@Repository
@RequiredArgsConstructor
public class UserRepositoryImpl implements UserRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<UserAdminUpdateResponse> findbyShopUpdate(Long userId) {
        List<UserAdminUpdateResponse> fetch = queryFactory
                .select(Projections.fields(UserAdminUpdateResponse.class,
                        user.id,
                        shop.shopName,
                        shop.shopComment,
                        shop.address.city,
                        shop.address.street,
                        shop.address.zipcode,
                        imageGroup.id,
                        image.originalFileName,
                        image.storedFileName,
                        image.storedFilePath))
                .from(user)
                .join(shop.user, user)
                .join(shop.imageGroup, imageGroup)
                .join(image.imageGroup, imageGroup)
                .where(user.id.eq(userId))
                .fetch();
        return fetch;
    }

    @Override
    public List<Shop> test(Long userId) {

        List<Shop> fetch =
                queryFactory
                        .select(shop)
                .from(user)
                        .where(user.id.eq(userId)).fetch();

        return fetch;
    }


}

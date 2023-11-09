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
    public UserAdminUpdateResponse findbyShopUpdate(Long userId) {

        UserAdminUpdateResponse fetch =

                queryFactory
                        .select(Projections.fields(UserAdminUpdateResponse.class,
                                shop.user,
                                shop.shopName,
                                shop.imageGroup,
                                shop.shopComment,
                                shop.address.city.as("userCity"),
                                shop.address.street.as("userStreet"),
                                shop.address.zipcode.as("userZipcode"),
                                image.originalFileName,
                                image.storedFileName,
                                image.storedFilePath))
                        .from(shop,image)
                        .innerJoin(shop.imageGroup).on(image.imageGroup.id.eq(shop.imageGroup.id))
                        .where(shop.user.id.eq(45L)).fetchOne();

        return fetch;
    }

}

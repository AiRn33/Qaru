package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.*;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;

import java.util.List;

import static Qaru.Prj.domain.entity.QImage.*;
import static Qaru.Prj.domain.entity.QImageGroup.imageGroup;
import static Qaru.Prj.domain.entity.QShop.shop;
import static Qaru.Prj.domain.entity.QUser.user;
import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@Slf4j
class UserRepositoryImplTest {

    @Autowired
    private JPAQueryFactory queryFactory;

    @Test
    void 가게정보조회QueryDsl(){

        UserAdminUpdateResponse fetch =

                queryFactory
                .select(Projections.fields(UserAdminUpdateResponse.class,
                        shop.user,
                        shop.shopName,
                        shop.imageGroup,
                        shop.shopComment,
                        shop.address.city,
                        shop.address.street,
                        shop.address.zipcode,
                        image.originalFileName,
                        image.storedFileName,
                        image.storedFilePath))
                .from(shop,image)
                        .innerJoin(shop.imageGroup).on(image.imageGroup.id.eq(shop.imageGroup.id))
                .where(shop.user.id.eq(45L)).fetchOne();

        assertThat(45L).isEqualTo(fetch.getUser().getId());

    }

}
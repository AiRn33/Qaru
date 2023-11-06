package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.*;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;

import java.util.List;

import static Qaru.Prj.domain.entity.QImage.*;
import static Qaru.Prj.domain.entity.QImageGroup.imageGroup;
import static Qaru.Prj.domain.entity.QShop.shop;
import static Qaru.Prj.domain.entity.QUser.user;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@Slf4j
class UserRepositoryImplTest {

    @Autowired
    private JPAQueryFactory queryFactory;

    @Test
    void 테스트(){

        List<UserAdminUpdateResponse> fetch =

                queryFactory
                .select(Projections.fields(UserAdminUpdateResponse.class,
                        shop.user.id,
                        shop.shopName,
                        shop.imageGroup.id,
                        shop.shopComment,
                        shop.address.city,
                        shop.address.street,
                        shop.address.zipcode,
                        image.originalFileName,
                        image.storedFileName,
                        image.storedFilePath))
                .from(shop)
                        .innerJoin(shop.imageGroup).on(image.imageGroup.id.eq(shop.imageGroup.id))
                .where(shop.user.id.eq(45L)).fetch();

        for (UserAdminUpdateResponse fetch1 : fetch) {
            log.info("================> : " + fetch1.toString());
        }
    }

}
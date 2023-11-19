package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Menu;
import Qaru.Prj.domain.entity.QMenu;
import Qaru.Prj.domain.entity.QMenuGroup;
import Qaru.Prj.domain.response.MenuListResponse;
import Qaru.Prj.domain.response.ShopListResponse;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

import static Qaru.Prj.domain.entity.QMenu.menu;
import static Qaru.Prj.domain.entity.QMenuGroup.menuGroup;
import static Qaru.Prj.domain.entity.QShop.shop;
import static Qaru.Prj.domain.entity.QUser.user;

@RequiredArgsConstructor
@Repository
public class MenuRepositoryImpl implements MenuRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<MenuListResponse> findByshopId(Long id) {
        return queryFactory.select(Projections.fields(MenuListResponse.class,
                    menu.id.as("menuId"),
                    menu.menuName.as("menuName"),
                    menu.menuComment.as("menuComment"),
                    menu.menuPrice.as("menuPrice"),
                    menu.imageGroup.id.as("imageGroupId")
                )).from(shop)
                .innerJoin(menuGroup).on(menuGroup.shop.id.eq(shop.id))
                .innerJoin(menu).on(menu.menuGroup.id.eq(menuGroup.id))
                .where(shop.id.eq(id))
                .fetch();
    }
}

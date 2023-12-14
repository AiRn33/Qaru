package Qaru.Prj.repository.Impl;

import Qaru.Prj.CreateClass;
import Qaru.Prj.domain.entity.*;
import Qaru.Prj.domain.response.OrdersResponse;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import Qaru.Prj.repository.*;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;

import java.util.ArrayList;
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

    @Autowired
    private ShopRepository shopRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private ImageGroupRepository imageGroupRepository;

    @Autowired
    private MenuGroupRepository menuGroupRepository;

    @Autowired
    private MenuRepository menuRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderMenuRepository orderMenuRepository;

    @Autowired
    private UserRepositoryImpl userRepositoryImpl;

    CreateClass create = new CreateClass();

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

    @Test
    void 유저주문정보조회(){
        // given
        User user = create.createUser();

        ImageGroup imageGroup = create.createImgGroup();
        imageGroupRepository.save(imageGroup);

        Shop shop = create.createShop(user, imageGroup);
        List<Image> list = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            Image image = create.createImg(imageGroup);
            list.add(image);
        }

        userRepository.save(user);
        shopRepository.save(shop);

        MenuGroup menuGroup = create.createMenuGroup(shop);
        menuGroupRepository.save(menuGroup);
        ImageGroup imgGroup1 = create.createImgGroup();
        imageGroupRepository.save(imgGroup1);
        Menu menu1 = create.createOrderMenuName(menuGroup, imgGroup1, "메뉴 1");
        menuRepository.save(menu1);

        ImageGroup imgGroup2 = create.createImgGroup();
        imageGroupRepository.save(imgGroup2);
        Menu menu2 = create.createOrderMenuName(menuGroup, imgGroup2, "메뉴 2");
        menuRepository.save(menu2);

        ImageGroup imgGroup3 = create.createImgGroup();
        imageGroupRepository.save(imgGroup3);
        Menu menu3 = create.createOrderMenuName(menuGroup, imgGroup3, "메뉴 3");
        menuRepository.save(menu3);

        List<Menu> menuList = menuRepository.findByMenuGroupId(menuGroup.getId());

        // when
        OrderMenu orderMenu = create.createOrderMenu(user, shop);
        orderMenuRepository.save(orderMenu);
        List<Order> orderList = new ArrayList<>();
        for (Menu menu : menuList) {
            Order order = create.createOrder(menu, orderMenu);
            orderMenu.updateOrderMenu(order.getOrderCount(), menu.getMenuPrice());
            orderList.add(order);
        }
        orderRepository.saveAll(orderList);

        List<OrdersResponse> ordersResponses = userRepositoryImpl.ordersList(user.getId());

    }

}
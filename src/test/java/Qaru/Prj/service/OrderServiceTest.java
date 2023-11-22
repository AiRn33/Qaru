package Qaru.Prj.service;

import Qaru.Prj.CreateClass;
import Qaru.Prj.domain.entity.*;
import Qaru.Prj.repository.*;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
public class OrderServiceTest {


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

    CreateClass create = new CreateClass();

    @Test
    void 주문생성() {

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
        OrderMenu orderMenu = create.createOrderMenu(user);
        orderMenuRepository.save(orderMenu);
        List<Order> orderList = new ArrayList<>();
        for (Menu menu : menuList) {
            Order order = create.createOrder(menu, orderMenu);
            orderMenu.updateOrderMenu(order.getOrderCount(), menu.getMenuPrice());
            orderList.add(order);
        }
        orderRepository.saveAll(orderList);

        List<Order> findOrderList = orderRepository.findByOrderMenuId(orderMenu.getId());

        // then
        Assertions.assertThat(findOrderList.size()).isEqualTo(orderList.size());
        Assertions.assertThat(orderMenu.getOrderMenuCount()).isEqualTo(9);
        Assertions.assertThat(orderMenu.getOrderMenuPrice()).isEqualTo(11111L * 9);
    }
}

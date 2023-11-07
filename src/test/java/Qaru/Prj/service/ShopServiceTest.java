package Qaru.Prj.service;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.Image;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.RoleType;
import Qaru.Prj.domain.enums.UserType;
import Qaru.Prj.repository.ImageRepository;
import Qaru.Prj.repository.ShopRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@SpringBootTest
@Transactional
@Slf4j
public class ShopServiceTest {

    @Autowired
    private ShopRepository shopRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ImageRepository imageRepository;

    CreateClass create = new CreateClass();
    @Test
    void 가게정보저장() {

        // given
        User user = create.createUser();

        ImageGroup imageGroup = create.createImgGroup();

        Shop shop = create.createShop(user, imageGroup);
        List<Image> list = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            Image image = create.createImg(imageGroup);
            list.add(image);
        }

        // then
        userRepository.save(user);
        shopRepository.save(shop);
        List<Image> images = imageRepository.saveAll(list);

        // when
        Assertions.assertThat(shop.getShopName()).isEqualTo(shopRepository.findById(shop.getId()).get().getShopName());
        Assertions.assertThat(images.size()).isEqualTo(3);
    }



}

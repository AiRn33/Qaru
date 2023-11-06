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

    @Test
    void 가게정보저장() {

        // given
        User user = createUser();

        ImageGroup imageGroup = createImgGroup();

        Shop shop = createShop(user, imageGroup);
        List<Image> list = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            Image image = createImg(imageGroup);
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


    static User createUser() {
        // 유저 저장
        return User.builder()
                .userId("test12355")
                .userPw("1234")
                .userNickName("nickname123")
                .userEmail("test155155@naver.com")
                .userSocialType(UserType.NOMAL)
                .dateTime(new DateTime().createTime())
                .role(RoleType.USER)
                .build();
    }

    static Shop createShop(User user, ImageGroup imageGroup) {
        // 가게 저장
        return Shop.builder()
                .shopName("shopName")
                .user(user)
                .imageGroup(imageGroup)
                .shopComment("shopComment")
                .address(new Address("city", "street", "00000"))
                .dateTime(new DateTime().createTime())
                .build();
    }

    static ImageGroup createImgGroup() {
        // 이미지 그룹 저장
        return ImageGroup.builder()
                .dateTime(new DateTime().createTime())
                .build();
    }

    static Image createImg(ImageGroup imageGroup) {

        String fileName = "fileName";

        return Image.builder()
                .imageGroup(imageGroup)
                .originalFileName(fileName)
                .storedFileName("storedFileName")
                .storedFilePath("C:/file")
                .build();
    }
}

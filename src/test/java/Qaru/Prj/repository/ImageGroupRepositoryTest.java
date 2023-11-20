package Qaru.Prj.repository;

import Qaru.Prj.CreateClass;
import Qaru.Prj.domain.entity.*;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
public class ImageGroupRepositoryTest {

    @Autowired
    private ImageGroupRepository imageGroupRepository;

    @Autowired
    private ShopRepository shopRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private MenuGroupRepository menuGroupRepository;

    @Autowired
    private MenuRepository menuRepository;


    @Test
    @Transactional
    void 이미지그룹가져오기(){

        CreateClass create = new CreateClass();

        // given
        User user = create.createUser();

        ImageGroup imageGroup = create.createImgGroup();

        Shop shop = create.createShop(user, imageGroup);
        List<Image> list = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            Image image = create.createImg(imageGroup);
            list.add(image);
        }
        userRepository.save(user);
        Shop save = shopRepository.save(shop);

        // then
        MenuGroup menuGroup = create.createMenuGroup(save);
        ImageGroup menuImageGroup = create.createImgGroup();

        for(int i = 0; i < 3; i++){
            menuRepository.save(create.createMenu(menuGroup,menuImageGroup));
        }


        // when
        Assertions.assertThat(3).isEqualTo(menuRepository.findByMenuGroupId(menuGroup.getId()).size());
    }
}

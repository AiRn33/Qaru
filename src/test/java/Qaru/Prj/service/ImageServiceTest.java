package Qaru.Prj.service;

import Qaru.Prj.domain.entity.Image;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.repository.ImageRepository;
import Qaru.Prj.repository.ShopRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@Slf4j
@SpringBootTest
class ImageServiceTest {

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ShopRepository shopRepository;
    CreateClass create = new CreateClass();

    @Test
    void 이미지조회(){

        // given
        Shop shop = create.createShop(userRepository.save(create.createUser()), create.createImgGroup());
        shopRepository.save(shop);
        List list = new ArrayList();
        for(int i = 0; i < 3; i++){
            list.add(create.createImg(shop.getImageGroup()));
        }
        imageRepository.saveAll(list);

        // when
        List<Image> byImageGroupId = imageRepository.findByImageGroupId(shop.getImageGroup().getId());

        // then
        Assertions.assertThat(3).isEqualTo(list.size());
        Assertions.assertThat(byImageGroupId.get(0).getImageGroup().getId()).isEqualTo(shop.getImageGroup().getId());
    }

    @Test
    @Transactional
    void 이미지삭제(){

        // given
        Shop shop = create.createShop(userRepository.save(create.createUser()), create.createImgGroup());
        shopRepository.save(shop);
        List list = new ArrayList();
        for(int i = 0; i < 3; i++){
            list.add(create.createImg(shop.getImageGroup()));
        }
        imageRepository.saveAll(list);
        List<Image> byImageGroupId2 = imageRepository.findByImageGroupId(shop.getImageGroup().getId());
        log.info("========> : " + byImageGroupId2.size());

        // when
        imageRepository.deleteByImageGroupId(shop.getImageGroup().getId());
        List<Image> byImageGroupId = imageRepository.findByImageGroupId(shop.getImageGroup().getId());

        Assertions.assertThat(byImageGroupId.size()).isEqualTo(0);

    }

}
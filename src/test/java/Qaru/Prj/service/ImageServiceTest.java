package Qaru.Prj.service;

import Qaru.Prj.domain.entity.Image;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.repository.ImageRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@Slf4j
@SpringBootTest
class ImageServiceTest {

    @Autowired
    private ImageRepository imageRepository;


}
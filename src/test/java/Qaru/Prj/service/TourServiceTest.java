package Qaru.Prj.service;

import Qaru.Prj.CreateClass;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.repository.ImageGroupRepository;
import Qaru.Prj.repository.TourRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class TourServiceTest {

    @Autowired
    private TourRepository tourRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ImageGroupRepository imageGroupRepository;

    CreateClass createClass = new CreateClass();
    @Test
    void 여행정보저장(){

        // given
        User user = createClass.createUser();
        userRepository.save(user);

        ImageGroup imageGroup = createClass.createImgGroup();

        // then
        Tour tour = tourRepository.save(createClass.createTour(imageGroup, user));

        // when
        Assertions.assertThat(tour.getUser().getId()).isEqualTo(user.getId());
    }

}

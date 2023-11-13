package Qaru.Prj.service;

import Qaru.Prj.CreateClass;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.request.TourCreateRequest;
import Qaru.Prj.repository.ImageGroupRepository;
import Qaru.Prj.repository.TourRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import javax.persistence.EntityManager;
import java.util.Optional;

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
    void 여행정보저장() {

        for(int i = 0; i < 100; i++){
            // given
            User user = createClass.createUser();
            userRepository.save(user);

            ImageGroup imageGroup = createClass.createImgGroup();

            // then
            Tour tour = tourRepository.save(createClass.createTour(imageGroup, user));

        }

        // when
//        Assertions.assertThat(tour.getUser().getId()).isEqualTo(user.getId());
    }

    @Test
    void 여행정보수정(){
        // given
        User user = createClass.createUser();
        userRepository.save(user);
        ImageGroup imageGroup = createClass.createImgGroup();
        Tour tour = tourRepository.save(createClass.createTour(imageGroup, user));

        // then
        TourCreateRequest createRequest = new TourCreateRequest();
        createRequest.setTourTitle("수정제목");
        createRequest.setTourContent("수정내용");
        tour.updateTour(createRequest);

        // when
        Assertions.assertThat(tour.getTourTitle()).isEqualTo("수정제목");
        Assertions.assertThat(tour.getTourContent()).isEqualTo("수정내용");
    }

    @Test
    void 여행정보삭제(){

        // given
        User user = createClass.createUser();
        userRepository.save(user);
        ImageGroup imageGroup = createClass.createImgGroup();
        Tour tour = tourRepository.save(createClass.createTour(imageGroup, user));

        // when
        tourRepository.deleteById(tour.getId());
        Optional<Tour> findTour = tourRepository.findById(tour.getId());

        // then
        Assertions.assertThat(!findTour.isPresent()).isEqualTo(true);
    }

}

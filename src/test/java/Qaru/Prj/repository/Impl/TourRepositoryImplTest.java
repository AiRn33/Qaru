package Qaru.Prj.repository.Impl;

import Qaru.Prj.CreateClass;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.QTour;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.response.TourListResponse;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import Qaru.Prj.repository.TourRepository;
import Qaru.Prj.repository.UserRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;

import java.util.List;

import static Qaru.Prj.domain.entity.QTour.*;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
@Slf4j
class TourRepositoryImplTest {

    @Autowired
    private JPAQueryFactory queryFactory;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TourRepository tourRepository;

    CreateClass createClass = new CreateClass();

    @Test
    void 여행정보검색QueryDsl(){
        // given
        User user = createClass.createUser();
        userRepository.save(user);
        ImageGroup imageGroup = createClass.createImgGroup();

        for(int i = 0; i < 100; i++){
            tourRepository.save(createClass.createTour(imageGroup, user));
        }

//        String type = "title";
        String type = "content";
        String content = "내용";

        BooleanBuilder bulider = new BooleanBuilder();
        if(type.equals("title")){
            bulider.and(QTour.tour.tourTitle.contains(content));
        }else if(type.equals("content")){
            bulider.and(QTour.tour.tourContent.contains(content));
        }

        List<TourListResponse> list =
                queryFactory
                        .select(Projections.fields(TourListResponse.class,
                                QTour.tour.id.as("tourId"),
                                QTour.tour.tourTitle.as("tourTitle"),
                                QTour.tour.tourContent.as("tourContent"),
                                QTour.tour.dateTime.updateDate.as("tourDate"),
                                QTour.tour.user.userNickName.as("userNickname")
                        ))
                        .from(QTour.tour)
                        .where(bulider)
                        .fetch();


        // when
        Assertions.assertThat(list.size() > 99).isEqualTo(true);

    }

}
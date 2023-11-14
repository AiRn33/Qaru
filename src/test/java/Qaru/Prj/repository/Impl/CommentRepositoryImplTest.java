package Qaru.Prj.repository.Impl;

import Qaru.Prj.CreateClass;
import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.repository.CommentRepository;
import Qaru.Prj.repository.ImageGroupRepository;
import Qaru.Prj.repository.TourRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@Slf4j
public class CommentRepositoryImplTest {

    @Autowired
    private CommentRepositoryImpl commentRepositoryImpl;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private ImageGroupRepository imageGroupRepository;

    CreateClass createClass = new CreateClass();


    @Test
    void 코멘트조회(){

        // given
        User user = createClass.createUser();
        userRepository.save(user);
        ImageGroup imgGroup = createClass.createImgGroup();
        Tour tour = createClass.createTour(imgGroup, user);
        tourRepository.save(tour);

        // then
        Comment comment = createClass.createComment(user, tour);
        commentRepository.save(comment);
        for(int i = 0; i < 3; i++){
            Comment recomment = createClass.createRecomment(user, tour, comment);
            commentRepository.save(recomment);
        }
        Comment comment2 = createClass.createComment(user, tour);
        commentRepository.save(comment2);
        for(int i = 0; i < 3; i++){
            Comment recomment2 = createClass.createRecomment(user, tour, comment2);
            commentRepository.save(recomment2);
        }

        List<Comment> commetList =
                commentRepositoryImpl.findCommentByTourId(tour.getId());

        // when
        Assertions.assertThat(commetList.size()).isEqualTo(8);

    }

    @Test
    void 게시글삭제시댓글삭제테스트(){
        // given
        User user = createClass.createUser();
        userRepository.save(user);
        ImageGroup imgGroup = createClass.createImgGroup();
        Tour tour = createClass.createTour(imgGroup, user);
        tourRepository.save(tour);

        // then
        Comment comment = createClass.createComment(user, tour);
        commentRepository.save(comment);

        Comment recomment = createClass.createRecomment(user, tour, comment);
        commentRepository.save(recomment);

        commentRepository.deleteById(comment.getId());

        Assertions.assertThat(commentRepository.findById(recomment.getId()).isPresent()).isEqualTo(false);

    }

    @Test
    void 댓글전체카운트(){
        // given
        User user = createClass.createUser();
        userRepository.save(user);
        ImageGroup imgGroup = createClass.createImgGroup();
        Tour tour = createClass.createTour(imgGroup, user);
        tourRepository.save(tour);

        Comment comment = createClass.createComment(user, tour);
        commentRepository.save(comment);

        for(int i = 0; i < 3; i++){
            Comment recomment = createClass.createRecomment(user, tour, comment);
            commentRepository.save(recomment);
        }

        // when
        Long count = commentRepositoryImpl.countCommentByTourId(tour.getId());


        // then
        Assertions.assertThat(count).isEqualTo(4);
    }
}

package Qaru.Prj.service;

import Qaru.Prj.CreateClass;
import Qaru.Prj.domain.entity.*;
import Qaru.Prj.repository.*;
import Qaru.Prj.repository.Impl.CommentRepositoryImpl;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import java.util.Optional;

@SpringBootTest
public class CommentServiceTest {

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

    @Autowired
    private LikesRepository likesRepository;

    CreateClass createClass = new CreateClass();


    @Test
    void 코멘트생성(){

        // given
        User user = createClass.createUser();
        userRepository.save(user);
        ImageGroup imgGroup = createClass.createImgGroup();
        Tour tour = createClass.createTour(imgGroup, user);
        tourRepository.save(tour);

        Comment comment = createClass.createComment(user, tour);
        commentRepository.save(comment);

        // then
        Comment findComment = commentRepository.findById(comment.getId()).get();

        // when
        Assertions.assertThat(findComment.getId()).isEqualTo(comment.getId());
    }

    @Test
    void 리코멘트생성(){

        // given
        User user = createClass.createUser();
        userRepository.save(user);
        ImageGroup imgGroup = createClass.createImgGroup();
        Tour tour = createClass.createTour(imgGroup, user);
        tourRepository.save(tour);

        Comment comment = createClass.createComment(user, tour);
        commentRepository.save(comment);

        Comment recomment = createClass.createRecomment(user, tour, comment);
        commentRepository.save(recomment);

        // then
        Comment findComment = commentRepository.findById(recomment.getId()).get();

        // when
        Assertions.assertThat(findComment.getParent().getId()).isEqualTo(comment.getId());
    }

    @Test
    void 댓글좋아요추가(){

        // given
        User user = createClass.createUser();
        userRepository.save(user);
        ImageGroup imageGroup = createClass.createImgGroup();
        Tour tour = tourRepository.save(createClass.createTour(imageGroup, user));
        Comment comment = createClass.createComment(user, tour);
        commentRepository.save(comment);

        // when
        Likes likesComment = createClass.createLikesComment(user, comment);
        likesRepository.save(likesComment);

        // then


    }

}

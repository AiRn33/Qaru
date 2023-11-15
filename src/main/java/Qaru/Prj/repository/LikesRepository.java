package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.entity.Likes;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LikesRepository extends JpaRepository<Likes, Long> {

    Long countByCommentAndUser(Comment comment, User user);
    Long countByTourAndUser(Tour tour, User user);

    Likes findByTourAndUser(Tour tour, User user);
    Likes findByCommentAndUser(Comment comment, User user);
}

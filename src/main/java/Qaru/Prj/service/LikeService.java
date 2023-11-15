package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.entity.Likes;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.response.TourViewResponse;
import Qaru.Prj.repository.CommentRepository;
import Qaru.Prj.repository.LikesRepository;
import Qaru.Prj.repository.TourRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LikeService {

    private final LikesRepository likesRepository;
    private final TourRepository tourRepository;
    private final CommentRepository commentRepository;

    public Long tourLikeAdd(PrincipalDetails request, Long id) {

        Tour tour = tourRepository.findById(id).get();
        Likes likes = Likes.builder()
                .user(request.getUser())
                .tour(tour)
                .build();

        likesRepository.save(likes);

        return likesRepository.countByTourAndUser(tour, request.getUser());
    }

    public Long commentLikeAdd(PrincipalDetails request, Long id) {

        Comment comment = commentRepository.findById(id).get();
        Likes likes = Likes.builder()
                .user(request.getUser())
                .comment(comment)
                .build();

        likesRepository.save(likes);

        return likesRepository.countByCommentAndUser(comment, request.getUser());
    }

    public Long tourLikeCount(PrincipalDetails request, Long id){
        Tour tour = tourRepository.findById(id).get();
        return likesRepository.countByTourAndUser(tour, request.getUser());
    }

    public Long tourLikeRemove(PrincipalDetails request, Long id) {

        Tour tour = tourRepository.findById(id).get();

        Likes like = likesRepository.findByTourAndUser(tour, request.getUser());

        likesRepository.deleteById(like.getId());

        return likesRepository.countByTourAndUser(tour, request.getUser());
    }

    public Long commentLikeRemove(PrincipalDetails request, Long id) {

        Comment comment = commentRepository.findById(id).get();

        Likes like = likesRepository.findByCommentAndUser(comment, request.getUser());


        likesRepository.deleteById(like.getId());

        return likesRepository.countByCommentAndUser(comment, request.getUser());
    }
}

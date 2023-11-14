package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.response.CommentResponse;
import Qaru.Prj.repository.CommentRepository;
import Qaru.Prj.repository.Impl.CommentRepositoryImpl;
import Qaru.Prj.repository.TourRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommentService {


    private final CommentRepository commentRepository;
    private final CommentRepositoryImpl commentRepositoryImpl;
    private final UserRepository userRepository;
    private final TourRepository tourRepository;

    public List<CommentResponse> commentView(String tourId) {

        // 댓글 정렬 후 반환
        List<CommentResponse> commentResponses = commentSort(tourId);

        return commentResponses;
    }

    public List<CommentResponse> createComment(String comment, String tourId, PrincipalDetails request) {

        Comment commentData
                = Comment.builder()
                .commentContent(comment)
                .user(request.getUser())
                .dateTime(new DateTime().createTime())
                .tour(tourRepository.findById(Long.valueOf(tourId)).get())
                .build();

        commentRepository.save(commentData);

        // 댓글 정렬 후 반환
        List<CommentResponse> commentResponses = commentSort(tourId);

        return commentResponses;
    }

    public List<CommentResponse> recreateComment(String comment, String tourId, String commentId, PrincipalDetails request) {

        Comment commentData
                = Comment.builder()
                .commentContent(comment)
                .user(request.getUser())
                .dateTime(new DateTime().createTime())
                .tour(tourRepository.findById(Long.valueOf(tourId)).get())
                .parent(commentRepository.findById(Long.valueOf(commentId)).get())
                .build();

        commentRepository.save(commentData);

        // 댓글 정렬 후 반환
        List<CommentResponse> commentResponses = commentSort(tourId);

        return commentResponses;
    }

    public List<CommentResponse> commentSort(String tourId){

        List<Comment> commentList = commentRepositoryImpl.findCommentByTourId(Long.valueOf(tourId));
        List<CommentResponse> result = new ArrayList<>();

        Map<Long, CommentResponse> map = new HashMap<>();

        commentList.stream().forEach(c -> {
            CommentResponse dto = new CommentResponse().createComment(c);
            if(c.getParent() != null){
                map.get(c.getParent().getId()).getChildren().add(dto);
            }else{
                map.put(dto.getComment_id(), dto);
            }
        });


        for(int i = 0; i < map.size(); i++){
            CommentResponse dto = new CommentResponse().createComment(commentList.get(i));
            result.add(dto);
            for(int j = 0; j < map.get(dto.getComment_id()).getChildren().size(); j++){
                result.add(map.get(dto.getComment_id()).getChildren().get(j));
            }
        }

        return result;
    }

    @Transactional
    public List<CommentResponse> commentUpdate(String comment, Long id, String tourId) {

        Comment comments = commentRepository.findById(id).get();

        comments.updateComment(comment, comments);

        List<CommentResponse> commentResponses = commentSort(tourId);

        return commentResponses;
    }

    public List<CommentResponse> commentDelete(Long id, String tourId) {

        commentRepository.deleteById(id);

        List<CommentResponse> commentResponses = commentSort(tourId);

        return commentResponses;
    }
}

package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.Comment;
import lombok.Getter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Getter
@ToString
public class CommentResponse {

    private String comment;

    private String userNickname;

    private Long parentId;

    private Long likeCount;

    private Long commentId;

//  댓글이면 false, 대댓글이면 true
    private Boolean recommentCheck;

    private List<CommentResponse> children = new ArrayList<>();

    private Long commentCount;

    private Long tourCount;

    public CommentResponse createComment(Comment comment){
        this.comment = comment.getCommentContent();
        this.userNickname = comment.getUser().getUserNickName();
        this.parentId = comment.getParent() != null ? comment.getParent().getId() : null;
        this.commentId = comment.getId();
        this.recommentCheck = comment.getParent() != null ? true : false;
        return this;
    }

    public CommentResponse setCommentCount(Long count, Long likeCount){
        this.commentCount = count;
        this.likeCount = likeCount;
        return this;
    }

    public CommentResponse updateLikeCount(Long count) {
        this.likeCount = count;
        return this;
    }

    public CommentResponse updateTourLikeCount(Long count) {
        this.tourCount = count;
        return this;
    }
}

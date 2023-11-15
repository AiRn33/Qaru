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

    private Long parent_id;

    private Long like_count;

    private Long comment_id;

//  댓글이면 false, 대댓글이면 true
    private Boolean recommentCheck;

    private List<CommentResponse> children = new ArrayList<>();

    private Long commentCount;

    public CommentResponse createComment(Comment comment){
        this.comment = comment.getCommentContent();
        this.userNickname = comment.getUser().getUserNickName();
        this.parent_id = comment.getParent() != null ? comment.getParent().getId() : null;
        this.comment_id = comment.getId();
        this.recommentCheck = comment.getParent() != null ? true : false;
        return this;
    }

    public CommentResponse setCommentCount(Long count, Long likeCount){
        this.commentCount = count;
        this.like_count = likeCount;
        return this;
    }

    public CommentResponse updateLikeCount(Long count) {
        this.like_count = count;
        return this;
    }
}

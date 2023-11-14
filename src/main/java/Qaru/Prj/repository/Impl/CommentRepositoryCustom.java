package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Comment;

import java.util.List;

public interface CommentRepositoryCustom {
    List<Comment> findCommentByTourId(Long tourId);

    Long countCommentByTourId(Long tourId);
}

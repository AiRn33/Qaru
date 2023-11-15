package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Comment;

import java.util.List;

public interface LikesRepositoryCustom {

    Long countByCommentAndUser(Long commentId, Long userId);
}

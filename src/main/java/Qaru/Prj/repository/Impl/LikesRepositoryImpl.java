package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.entity.QComment;
import Qaru.Prj.domain.entity.QLikes;
import Qaru.Prj.domain.entity.QUser;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static Qaru.Prj.domain.entity.QComment.comment;
import static Qaru.Prj.domain.entity.QLikes.*;

@RequiredArgsConstructor
@Repository
public class LikesRepositoryImpl implements LikesRepositoryCustom {

    private final JPAQueryFactory queryFactory;


    @Override
    public Long countByCommentAndUser(Long commentId, Long userId) {

        return queryFactory
                .select(likes.count())
                .from(likes)
                .where(likes.comment.id.eq(commentId).and(likes.user.id.eq(userId)))
                .fetchOne();
    }
}

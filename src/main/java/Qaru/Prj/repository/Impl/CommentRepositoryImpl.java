package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Comment;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static Qaru.Prj.domain.entity.QComment.comment;
import static Qaru.Prj.domain.entity.QTour.tour;

@RequiredArgsConstructor
@Repository
public class CommentRepositoryImpl implements CommentRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<Comment> findCommentByTourId(Long tourId) {

        return queryFactory.selectFrom(comment)
                .leftJoin(comment.parent)
                .fetchJoin()
                .where(comment.tour.id.eq(tourId))
                .orderBy(
                        comment.parent.id.asc().nullsFirst(),
                        comment.dateTime.createDate.asc()
                ).fetch();
    }

    @Override
    public Long countCommentByTourId(Long tourId) {
        return queryFactory
                .select(comment.count())
                .from(comment, tour)
                .where(tour.id.eq(tourId))
                .fetchFirst();
    }


}

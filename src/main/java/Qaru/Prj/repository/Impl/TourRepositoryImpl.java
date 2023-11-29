package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.QComment;
import Qaru.Prj.domain.entity.QLikes;
import Qaru.Prj.domain.response.TourListResponse;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.ExpressionUtils;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.StringPath;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

import static Qaru.Prj.domain.entity.QComment.comment;
import static Qaru.Prj.domain.entity.QLikes.likes;
import static Qaru.Prj.domain.entity.QTour.tour;
import static io.lettuce.core.GeoArgs.Unit.m;

@Repository
@RequiredArgsConstructor
public class TourRepositoryImpl implements TourRepositoryCustom{

    private final JPAQueryFactory queryFactory;

    @Override
    public Page<TourListResponse> searchPage(Pageable pageable) {


        List<TourListResponse> tourList = queryFactory	// (1)
                .select(Projections.fields(TourListResponse.class,
                        tour.id.as("tourId"),
                        tour.tourTitle.as("tourTitle"),
                        tour.tourContent.as("tourContent"),
                        tour.dateTime.updateDate.as("tourDate"),
                        tour.user.userNickName.as("userNickname"),
                        tour.imageGroup.id.as("imageGroupId"),
                        ExpressionUtils.as(
                                JPAExpressions.select(likes.count())
                                        .from(likes)
                                        .where(likes.tour.id.eq(tour.id)),
                                "likesCount"),
                        ExpressionUtils.as(
                                JPAExpressions.select(comment.count())
                                        .from(comment)
                                        .where(comment.tour.id.eq(tour.id)),
                                "commentCount")
                ))
                .from(tour)
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .orderBy(tour.id.desc())
                .fetch();


        return new PageImpl<>(tourList, pageable, tourList.size());
    }

    @Override
    public Page<TourListResponse> searchPageLikes(Pageable pageable) {

        StringPath aliasQuantity = Expressions.stringPath("likesCount");

        List<TourListResponse> tourList = queryFactory	// (1)
                .select(Projections.fields(TourListResponse.class,
                        tour.id.as("tourId"),
                        tour.tourTitle.as("tourTitle"),
                        tour.tourContent.as("tourContent"),
                        tour.dateTime.updateDate.as("tourDate"),
                        tour.user.userNickName.as("userNickname"),
                        tour.imageGroup.id.as("imageGroupId"),
                        ExpressionUtils.as(
                                JPAExpressions.select(likes.count())
                                        .from(likes)
                                        .where(likes.tour.id.eq(tour.id)),
                                "likesCount"),
                        ExpressionUtils.as(
                                JPAExpressions.select(comment.count())
                                        .from(comment)
                                        .where(comment.tour.id.eq(tour.id)),
                                "commentCount")
                ))
                .from(tour)
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .orderBy(aliasQuantity.desc())
                .fetch();


        return new PageImpl<>(tourList, pageable, tourList.size());
    }

    @Override
    public Page<TourListResponse> searchPageComments(Pageable pageable) {

        StringPath aliasQuantity = Expressions.stringPath("commentCount");

        List<TourListResponse> tourList = queryFactory	// (1)
                .select(Projections.fields(TourListResponse.class,
                        tour.id.as("tourId"),
                        tour.tourTitle.as("tourTitle"),
                        tour.tourContent.as("tourContent"),
                        tour.dateTime.updateDate.as("tourDate"),
                        tour.user.userNickName.as("userNickname"),
                        tour.imageGroup.id.as("imageGroupId"),
                        ExpressionUtils.as(
                                JPAExpressions.select(likes.count())
                                        .from(likes)
                                        .where(likes.tour.id.eq(tour.id)),
                                "likesCount"),
                        ExpressionUtils.as(
                                JPAExpressions.select(comment.count())
                                        .from(comment)
                                        .where(comment.tour.id.eq(tour.id)),
                                "commentCount")
                ))
                .from(tour)
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .orderBy(aliasQuantity.desc())
                .fetch();


        return new PageImpl<>(tourList, pageable, tourList.size());
    }

    @Override
    public Long searchPageCount() {
        Long count = queryFactory
                .select(tour)
                .from(tour)
                .fetchCount();

        return count;
    }

    @Override
    public List<TourListResponse> searchData(String type, String content) {

        BooleanBuilder bulider = new BooleanBuilder();
        if(type.equals("title")){
            bulider.and(tour.tourTitle.contains(content));
        }else if(type.equals("content")){
            bulider.and(tour.tourContent.contains(content));
        }

        List<TourListResponse> list =
                queryFactory
                        .select(Projections.fields(TourListResponse.class,
                                tour.id.as("tourId"),
                                tour.tourTitle.as("tourTitle"),
                                tour.tourContent.as("tourContent"),
                                tour.dateTime.updateDate.as("tourDate"),
                                tour.user.userNickName.as("userNickname"),
                                tour.imageGroup.id.as("imageGroupId"),
                                ExpressionUtils.as(
                                        JPAExpressions.select(likes.count())
                                                .from(likes)
                                                .where(likes.tour.id.eq(tour.id)),
                                        "likesCount"),
                                ExpressionUtils.as(
                                        JPAExpressions.select(comment.count())
                                                .from(comment)
                                                .where(comment.tour.id.eq(tour.id)),
                                        "commentCount")
                        ))
                        .from(tour)
                        .where(bulider)
                        .fetch();

        return list;
    }

    @Override
    public List<TourListResponse> searchDataLikes(String type, String content) {

        BooleanBuilder bulider = new BooleanBuilder();
        if(type.equals("title")){
            bulider.and(tour.tourTitle.contains(content));
        }else if(type.equals("content")){
            bulider.and(tour.tourContent.contains(content));
        }
        StringPath aliasQuantity = Expressions.stringPath("likesCount");

        List<TourListResponse> list =
                queryFactory
                        .select(Projections.fields(TourListResponse.class,
                                tour.id.as("tourId"),
                                tour.tourTitle.as("tourTitle"),
                                tour.tourContent.as("tourContent"),
                                tour.dateTime.updateDate.as("tourDate"),
                                tour.user.userNickName.as("userNickname"),
                                tour.imageGroup.id.as("imageGroupId"),
                                ExpressionUtils.as(
                                        JPAExpressions.select(likes.count())
                                                .from(likes)
                                                .where(likes.tour.id.eq(tour.id)),
                                        "likesCount"),
                                ExpressionUtils.as(
                                        JPAExpressions.select(comment.count())
                                                .from(comment)
                                                .where(comment.tour.id.eq(tour.id)),
                                        "commentCount")
                        ))
                        .from(tour)
                        .where(bulider)
                        .orderBy(aliasQuantity.desc())
                        .fetch();

        return list;
    }

    @Override
    public List<TourListResponse> searchDataComments(String type, String content) {

        BooleanBuilder bulider = new BooleanBuilder();
        if(type.equals("title")){
            bulider.and(tour.tourTitle.contains(content));
        }else if(type.equals("content")){
            bulider.and(tour.tourContent.contains(content));
        }

        StringPath aliasQuantity = Expressions.stringPath("commentCount");

        List<TourListResponse> list =
                queryFactory
                        .select(Projections.fields(TourListResponse.class,
                                tour.id.as("tourId"),
                                tour.tourTitle.as("tourTitle"),
                                tour.tourContent.as("tourContent"),
                                tour.dateTime.updateDate.as("tourDate"),
                                tour.user.userNickName.as("userNickname"),
                                tour.imageGroup.id.as("imageGroupId"),
                                ExpressionUtils.as(
                                        JPAExpressions.select(likes.count())
                                                .from(likes)
                                                .where(likes.tour.id.eq(tour.id)),
                                        "likesCount"),
                                ExpressionUtils.as(
                                        JPAExpressions.select(comment.count())
                                                .from(comment)
                                                .where(comment.tour.id.eq(tour.id)),
                                        "commentCount")
                        ))
                        .from(tour)
                        .where(bulider)
                        .orderBy(aliasQuantity.desc())
                        .fetch();

        return list;
    }

    @Override
    public List<TourListResponse> qrTourListByUser(Long userId) {

        List<TourListResponse> list =
                queryFactory
                        .select(Projections.fields(TourListResponse.class,
                                tour.id.as("tourId"),
                                tour.tourTitle.as("tourTitle")
                        ))
                        .from(tour)
                        .where(tour.user.id.eq(userId))
                        .fetch();

        return list;
    }

}

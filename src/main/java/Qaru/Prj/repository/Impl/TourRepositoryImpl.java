package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.response.TourListResponse;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

import static Qaru.Prj.domain.entity.QTour.tour;

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
                        tour.imageGroup.id.as("imageGroupId")
                ))
                .from(tour)
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .orderBy(tour.id.desc())
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
                                tour.imageGroup.id.as("imageGroupId")
                        ))
                        .from(tour)
                        .where(bulider)
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

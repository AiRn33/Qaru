package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.request.TourCreateRequest;
import Qaru.Prj.domain.response.TourListResponse;
import Qaru.Prj.domain.response.TourViewResponse;
import Qaru.Prj.repository.ImageGroupRepository;
import Qaru.Prj.repository.Impl.CommentRepositoryImpl;
import Qaru.Prj.repository.Impl.TourRepositoryImpl;
import Qaru.Prj.repository.TourRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TourService {

    private final TourRepository tourRepository;
    private final UserRepository userRepository;
    private final TourRepositoryImpl tourRepositoryImpl;
    private final CommentRepositoryImpl commentRepositoryImpl;
    private final ImageGroupService imageGroupService;


    public ImageGroup createTour(PrincipalDetails principalDetails, TourCreateRequest request){

        User user = userRepository.findByUserId(principalDetails.getUsername()).get();

        Tour tour = Tour.builder()
                .imageGroup(imageGroupService.createImageGroup())
                .user(user)
                .tourTitle(request.getTourTitle())
                .tourContent(request.getTourContent())
                .address(new Address(request.getCity(), request.getStreet(), request.getZipcode()))
                .dateTime(new DateTime().createTime())
                .build();

        tourRepository.save(tour);

        return tour.getImageGroup();
    }

    public Page<TourListResponse> searchTourListAll(Pageable pageable){

        Page<TourListResponse> tourListResponses = tourRepositoryImpl.searchPage(pageable);

        return tourListResponses;
    }

    public Long searchTourListAllCount(){

        return tourRepositoryImpl.searchPageCount();
    }

    public TourViewResponse getTour(Long tourId) throws Exception {

        Tour tour = tourRepository.findById(tourId).orElseThrow(() -> new Exception("게시글이 존재하지 않습니다."));

        Long commentCount = commentRepositoryImpl.countCommentByTourId(tourId);
        TourViewResponse tourViewResponse = new TourViewResponse().createView(tour);
        tourViewResponse.setCommentCount(commentCount);

        return tourViewResponse;
    }

    @Transactional
    public TourViewResponse updateTour(TourCreateRequest request, Long tourId) {

        Tour tour = tourRepository.findById(tourId).get().updateTour(request);

        Long commentCount = commentRepositoryImpl.countCommentByTourId(tourId);
        TourViewResponse tourViewResponse = new TourViewResponse().createView(tour);
        tourViewResponse.setCommentCount(commentCount);

        return tourViewResponse;
    }

    public void deleteTour(Long id) {

        tourRepository.deleteById(id);
    }

    public List<TourListResponse> searchData(String type, String content) {

        List<TourListResponse> tourListResponses = tourRepositoryImpl.searchData(type, content);

        return tourListResponses;
    }
}

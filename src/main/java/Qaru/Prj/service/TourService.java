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
import Qaru.Prj.repository.Impl.TourRepositoryImpl;
import Qaru.Prj.repository.TourRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TourService {

    private final TourRepository tourRepository;
    private final UserRepository userRepository;
    private final TourRepositoryImpl tourRepositoryImpl;

    public ImageGroup createTour(PrincipalDetails principalDetails, TourCreateRequest request){

        User user = userRepository.findByUserId(principalDetails.getUsername()).get();

        Tour tour = Tour.builder()
                .imageGroup(new ImageGroup(new DateTime().createTime()))
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

        TourViewResponse tourViewResponse = new TourViewResponse().createView(tour);

        return tourViewResponse;
    }
}

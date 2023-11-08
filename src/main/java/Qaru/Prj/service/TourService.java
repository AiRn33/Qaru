package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.request.TourCreateRequest;
import Qaru.Prj.repository.TourRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TourService {

    private final TourRepository tourRepository;
    private final UserRepository userRepository;

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
}

package Qaru.Prj.domain.response;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class TourViewResponse {

    private Long tourId;

    private String tourTitle;

    private String tourContent;

    private ImageGroup imageGroup;

    private String city;

    private String street;

    private String zipcode;

    private String userNickname;

    private Long commentCount;

    public TourViewResponse createView(Tour tour){
        this.tourId = tour.getId();
        this.tourTitle = tour.getTourTitle();
        this.tourContent = tour.getTourContent();
        this.imageGroup = tour.getImageGroup();
        this.city = tour.getAddress().getCity();
        this.street = tour.getAddress().getStreet();
        this.zipcode = tour.getAddress().getZipcode();
        this.userNickname = tour.getUser().getUserNickName();
        return this;
    }

    public TourViewResponse setCommentCount(Long commentCount){
        this.commentCount = commentCount;
        return this;
    }
}

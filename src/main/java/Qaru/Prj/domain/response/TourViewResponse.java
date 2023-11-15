package Qaru.Prj.domain.response;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class TourViewResponse {

    private Long tour_id;

    private String tour_title;

    private String tour_content;

    private ImageGroup imageGroup;

    private String city;

    private String street;

    private String zipcode;

    private String userNickname;

    private Long commentCount;

    public TourViewResponse createView(Tour tour){
        this.tour_id = tour.getId();
        this.tour_title = tour.getTourTitle();
        this.tour_content = tour.getTourContent();
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

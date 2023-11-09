package Qaru.Prj.domain.response;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class TourViewResponse {

    private String tour_title;

    private String tour_content;

    private ImageGroup imageGroup;

    private Address address;

    private String userNickname;

    public TourViewResponse createView(Tour tour){
        this.tour_title = tour.getTourTitle();
        this.tour_content = tour.getTourContent();
        this.imageGroup = tour.getImageGroup();
        this.address = tour.getAddress();
        this.userNickname = tour.getUser().getUserNickName();
        return this;
    }
}

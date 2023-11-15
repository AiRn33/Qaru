package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.request.TourCreateRequest;
import Qaru.Prj.domain.request.UserUpdateRequest;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Getter;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@DynamicUpdate //변경된 필드만 적용
public class Tour {

    @Id
    @GeneratedValue
    @Column(name = "tour_id")
    private Long id;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "img_group_id")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private ImageGroup imageGroup;

    @Column(name = "tour_title")
    private String tourTitle;

    @Column(name = "tour_content")
    private String tourContent;

    @Embedded
    private DateTime dateTime;

    @Embedded
    private Address address;

    @OneToMany(mappedBy = "tour", orphanRemoval = true)
    private List<Likes> likesList = new ArrayList<>();

    @Builder
    public Tour(Long id, User user, ImageGroup imageGroup, String tourTitle, String tourContent, DateTime dateTime, Address address) {
        this.id = id;
        this.user = user;
        this.imageGroup = imageGroup;
        this.tourTitle = tourTitle;
        this.tourContent = tourContent;
        this.dateTime = dateTime;
        this.address = address;
    }

    public Tour updateTour(TourCreateRequest request){
        this.tourTitle = request.getTourTitle();
        this.tourContent = request.getTourContent();
        this.address = new Address(request.getCity(), request.getStreet(), request.getZipcode());
        this.dateTime = new DateTime().tourUpdateTime(this);
        return this;
    }

    protected Tour() {

    }
}

package Qaru.Prj.domain.entity;


import Qaru.Prj.domain.baseEntity.DateTime;
import lombok.Builder;
import lombok.Getter;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@DynamicUpdate //변경된 필드만 적용
public class ImageGroup {

    @Id
    @GeneratedValue
    @Column(name = "image_group_id")
    private Long id;

    @Embedded
    private DateTime dateTime;


    protected ImageGroup() {

    }

    @Builder
    public ImageGroup(DateTime dateTime) {
        this.dateTime = dateTime;
    }

    public ImageGroup updateImageGroup(ImageGroup imageGroup){
        this.dateTime = dateTime.ImageGroupUpdateTime(imageGroup);
        return this;
    }
}

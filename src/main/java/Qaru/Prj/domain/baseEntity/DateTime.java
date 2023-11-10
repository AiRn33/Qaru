package Qaru.Prj.domain.baseEntity;

import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.entity.User;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import java.time.LocalDateTime;

@Getter
@DynamicUpdate //변경된 필드만 적용
public class DateTime {

    private LocalDateTime createDate;
    private LocalDateTime updateDate;

    public DateTime() {
    }

    public DateTime(LocalDateTime createDate, LocalDateTime updateDate) {
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public DateTime createTime(){
        this.createDate = LocalDateTime.now();
        this.updateDate = LocalDateTime.now();
        return this;
    }

    public DateTime userUpdateTime(User user){
        this.createDate = user.getDateTime().getCreateDate();
        this.updateDate = LocalDateTime.now();
        return this;
    }


    public DateTime shopUpdateTime(Shop shop){
        this.createDate = shop.getDateTime().getCreateDate();
        this.updateDate = LocalDateTime.now();
        return this;
    }

    public DateTime ImageGroupUpdateTime(ImageGroup imageGroup){
        this.createDate = imageGroup.getDateTime().getCreateDate();
        this.updateDate = LocalDateTime.now();
        return this;
    }

    public DateTime tourUpdateTime(Tour tour){
        this.createDate = tour.getDateTime().getCreateDate();
        this.updateDate = LocalDateTime.now();
        return this;
    }
}

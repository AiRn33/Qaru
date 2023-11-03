package Qaru.Prj.domain.baseEntity;

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

    public DateTime updateTime(User user){
        this.createDate = user.getDateTime().getCreateDate();
        this.updateDate = LocalDateTime.now();
        return this;
    }
}

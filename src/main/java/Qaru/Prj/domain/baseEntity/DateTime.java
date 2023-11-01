package Qaru.Prj.domain.baseEntity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;

@Getter
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
}

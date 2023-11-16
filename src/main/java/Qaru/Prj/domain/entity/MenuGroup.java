package Qaru.Prj.domain.entity;


import Qaru.Prj.domain.baseEntity.DateTime;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Getter
@DynamicUpdate //변경된 필드만 적용
public class MenuGroup {

    @Id
    @GeneratedValue
    @Column(name = "menu_group_id")
    private Long id;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "shop_id")
    private Shop shop;

    @Embedded
    private DateTime dateTime;
}

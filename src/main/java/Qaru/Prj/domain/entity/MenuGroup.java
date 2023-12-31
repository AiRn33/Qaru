package Qaru.Prj.domain.entity;


import Qaru.Prj.domain.baseEntity.DateTime;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Getter;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Getter
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

    protected MenuGroup() {
    }

    @Builder
    public MenuGroup(Long id, Shop shop, DateTime dateTime) {
        this.id = id;
        this.shop = shop;
        this.dateTime = dateTime;
    }
}

package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;

import javax.persistence.*;

//@Entity
@Table(name = "shop")
@Getter
public class Shop {

    @Id
    @GeneratedValue
    @Column(name = "shop_id")
    private Long id;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User member;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "img_group_id")
    private ImageGroup imageGroup;

    @Column(name = "shop_name")
    private String shopName;

    @Column(name = "shop_comment")
    private String shopComment;

    @Embedded
    private DateTime dateTime;

    @Embedded
    private Address address;
}

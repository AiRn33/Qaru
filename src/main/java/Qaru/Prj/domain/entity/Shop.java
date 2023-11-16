package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.request.ShopUpdateRequest;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Getter;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Getter
@DynamicUpdate //변경된 필드만 적용
public class Shop {

    @Id
    @GeneratedValue
    @Column(name = "shop_id")
    private Long id;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "img_group_id")
    @Cascade(CascadeType.ALL)
    private ImageGroup imageGroup;

    @Column(name = "shop_name")
    private String shopName;

    @Column(name = "shop_comment")
    private String shopComment;

    @Column(name = "shop_type")
    private String shopType;

    @Column(name = "menu_check")
    private Boolean menuCheck;

    @Embedded
    private DateTime dateTime;

    @Embedded
    private Address address;

    @Builder
    public Shop(User user, ImageGroup imageGroup, String shopName, String shopComment, DateTime dateTime, String shopType,Address address) {
        this.user = user;
        this.imageGroup = imageGroup;
        this.shopName = shopName;
        this.shopComment = shopComment;
        this.dateTime = dateTime;
        this.address = address;
        this.shopType = shopType;
        this.menuCheck = false;
    }

    public Shop updateShop(ShopUpdateRequest request, Shop shop){
        this.shopName = request.getShopName();
        this.shopComment = request.getShopComment();
        this.shopType = request.getShopType();
        this.dateTime = dateTime.shopUpdateTime(shop);
        this.address = new Address(request.getUserCity(), request.getUserStreet(), request.getUserZipcode());
        return this;
    }

    protected Shop() {

    }
}

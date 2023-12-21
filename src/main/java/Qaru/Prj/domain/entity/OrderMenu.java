package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.enums.StatusType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Getter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
public class OrderMenu {

    @Id
    @GeneratedValue
    @Column(name = "order_menu_id")
    private Long id;


    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;


    @JoinColumn(name = "order_menu_count")
    private Long orderMenuCount;

    @JoinColumn(name = "order_menu_price")
    private Long orderMenuPrice;

    @Column(name = "order_status")
    @Enumerated(EnumType.STRING)
    private StatusType statusType;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "shop_id")
    private Shop shop;

    protected OrderMenu(){

    }

    @Builder
    public OrderMenu(Long id, Shop shop, User user, Long orderMenuCount, Long orderMenuPrice) {
        this.id = id;
        this.user = user;
        this.shop = shop;
        this.statusType = StatusType.INCOMPLETE;
        this.orderMenuCount = orderMenuCount;
        this.orderMenuPrice = orderMenuPrice;
    }

    public OrderMenu updateOrderMenu(Long updateCount, Long updatePrice){
        this.orderMenuCount += updateCount;
        this.orderMenuPrice += updatePrice * updateCount;
        return this;
    }

    public OrderMenu updateOrderStatus(String value){
        if(value.equals("1")){
            this.statusType = StatusType.INCOMPLETE;
        }else if(value.equals("2")){
            this.statusType = StatusType.COMPLETE;
        }
        return this;
    }
}

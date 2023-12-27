package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.baseEntity.DateTime;
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

    @Embedded
    private DateTime dateTime;

    protected OrderMenu(){

    }

    @Builder
    public OrderMenu(Long id, Shop shop, User user, Long orderMenuCount, Long orderMenuPrice, DateTime dateTime, StatusType statusType) {
        this.id = id;
        this.user = user;
        this.shop = shop;
        this.statusType = statusType;
        this.orderMenuCount = orderMenuCount;
        this.orderMenuPrice = orderMenuPrice;
        this.dateTime = dateTime;
    }

    public OrderMenu updateOrderMenu(Long updateCount, Long updatePrice){
        this.orderMenuCount += updateCount;
        this.orderMenuPrice += updatePrice * updateCount;
        return this;
    }

    public OrderMenu updateOrderStatus(String value, OrderMenu orderMenu){
        if(value.equals("1")){
            this.statusType = StatusType.INCOMPLETE;
            this.dateTime.orderMenuUpdateTime(orderMenu);
        }else if(value.equals("2")){
            this.statusType = StatusType.COMPLETE;
            this.dateTime.orderMenuUpdateTime(orderMenu);
        }else if(value.equals("3")){
            this.statusType = StatusType.TAKE_INCOMPLETE;
            this.dateTime.orderMenuUpdateTime(orderMenu);
        }else if(value.equals("4")){
            this.statusType = StatusType.TAKE_COMPLETE;
            this.dateTime.orderMenuUpdateTime(orderMenu);
        }
        return this;
    }
}

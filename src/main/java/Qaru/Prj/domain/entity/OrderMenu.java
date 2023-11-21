package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.enums.StatusType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;

import javax.persistence.*;

@Entity
public class OrderMenu {

    @Id
    @GeneratedValue
    @Column(name = "order_menu_id")
    private Long id;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "menu_id")
    private Menu menu;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id")
    private Order order;

    @JoinColumn(name = "order_count")
    private Long orderCount;

    @JoinColumn(name = "order_price")
    private Long orderPrice;

    protected OrderMenu(){

    }

    @Builder
    public OrderMenu(Long id, Menu menu, Order order, Long orderCount, Long orderPrice) {
        this.id = id;
        this.menu = menu;
        this.order = order;
        this.orderCount = orderCount;
        this.orderPrice = orderPrice;
    }
}

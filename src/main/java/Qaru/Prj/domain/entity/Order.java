package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.enums.StatusType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Getter;

import javax.persistence.*;

@Entity
@Getter
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue
    @Column(name = "order_id")
    private Long id;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "menu_id")
    private Menu menu;

    @Column(name = "order_status")
    @Enumerated(EnumType.STRING)
    private StatusType statusType;

    @JoinColumn(name = "order_count")
    private Long orderCount;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_menu_id")
    private OrderMenu orderMenu;

    protected Order(){

    }
    @Builder
    public Order(Long id, Menu menu, StatusType statusType, Long orderCount, OrderMenu orderMenu) {
        this.id = id;
        this.menu = menu;
        this.statusType = statusType;
        this.orderCount = orderCount;
        this.orderMenu = orderMenu;
    }
}

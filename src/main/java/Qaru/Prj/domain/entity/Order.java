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
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_menu_id")
    private OrderMenu orderMenu;

    @Column(name = "order_status")
    @Enumerated(EnumType.STRING)
    private StatusType statusType;

    protected Order(){

    }

    @Builder
    public Order(Long id, User user, OrderMenu orderMenu, StatusType statusType) {
        this.id = id;
        this.user = user;
        this.orderMenu = orderMenu;
        this.statusType = statusType;
    }
}

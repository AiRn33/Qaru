package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.Menu;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderMenuCheckResponse {

    private Long menuId;

    private String menuName;

    private Long menuPrice;

    private Long menuCount;

    private Long menuAllPrice;

    private Long orderMenuId;

    public OrderMenuCheckResponse orderMenuSet(Menu menu, Long inputCount) {
        this.menuId = menu.getId();
        this.menuName = menu.getMenuName();
        this.menuPrice = menu.getMenuPrice();
        this.menuCount = inputCount;
        this.menuAllPrice = inputCount * menu.getMenuPrice();
        return this;
    }

    public OrderMenuCheckResponse orderDataSet(OrdersResponse response){
        this.orderMenuId = response.getOrderMenuId();
        this.menuName = response.getMenuName();
        this.menuCount = response.getOrderCount();
        return this;
    }
}

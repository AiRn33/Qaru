package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.Menu;
import Qaru.Prj.domain.entity.Order;
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
    public OrderMenuCheckResponse orderDataSet(OrderStatisticsResponse response){
        this.orderMenuId = response.getOrderMenuId();
        this.menuName = response.getMenuName();
        this.menuCount = response.getOrderCount();
        return this;
    }

    public OrderMenuCheckResponse orderDataSet(OrderMenuCheckResponse order){
        if(order.menuName == null){
            this.menuName = "단종 된 메뉴";
        }else{
            this.menuName = order.menuName;
        }
        this.menuCount = order.getMenuCount();
        return this;
    }
}

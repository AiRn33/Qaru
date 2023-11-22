package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.Menu;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Setter
@Getter
@ToString
public class orderMenuCheckResponse {

    private Long menuId;

    private String menuName;

    private Long menuPrice;

    private Long menuCount;

    private Long menuAllPrice;

    public orderMenuCheckResponse orderMenuSet(Menu menu, Long inputCount) {
        this.menuId = menu.getId();
        this.menuName = menu.getMenuName();
        this.menuPrice = menu.getMenuPrice();
        this.menuCount = inputCount;
        this.menuAllPrice = inputCount * menu.getMenuPrice();
        return this;
    }
}

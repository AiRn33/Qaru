package Qaru.Prj.domain.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class OrderRequest {

    private Long orderPriceAll;

    private Long orderCount;

    private Long menuId;
}

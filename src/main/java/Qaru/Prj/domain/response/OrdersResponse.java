package Qaru.Prj.domain.response;

import Qaru.Prj.domain.enums.StatusType;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
public class OrdersResponse {

    private Long shopId;

    private String shopName;

    private String menuName;

    private Long orderMenuId;

    private Long orderMenuCount;

    private Long orderMenuPrice;

    private StatusType statusType;

    private String menuNameAll;

    private Long orderCount;

    private String userNickName;

    private List<OrderMenuCheckResponse> orderData = new ArrayList<>();

}

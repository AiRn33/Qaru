package Qaru.Prj.domain.response;

import Qaru.Prj.domain.enums.StatusType;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
public class OrderStatisticsResponse {

    private Long userId;
    private Long orderMenuId;
    private String userNickName;

    private String orderMenuName;
    private String MenuNameAll;

    private Long orderMenuPrice;
    private Long orderMenuCount;
    private String menuName;

    private Long orderCount;

    private Long shopId;

    private LocalDateTime createDate;

    private StatusType orderStatus;
    private String orderData;

    private List<OrderMenuCheckResponse> orderList = new ArrayList<>();
}

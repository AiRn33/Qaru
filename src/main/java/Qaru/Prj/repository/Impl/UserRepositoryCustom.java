package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.response.OrdersResponse;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;

import java.util.List;

public interface UserRepositoryCustom {

    UserAdminUpdateResponse findbyShopUpdate(Long userId);

    List<OrdersResponse> ordersList(Long userId);

    List<OrdersResponse> adminOrdersList(Long userId);
}

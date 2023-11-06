package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;

import java.util.List;

public interface UserRepositoryCustom {

    List<UserAdminUpdateResponse> findbyShopUpdate(Long userId);

    List<Shop> test(Long userId);
}

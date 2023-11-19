package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.entity.Menu;
import Qaru.Prj.domain.response.MenuListResponse;

import java.util.List;

public interface MenuRepositoryCustom {

    List<MenuListResponse> findByshopId(Long id);
}

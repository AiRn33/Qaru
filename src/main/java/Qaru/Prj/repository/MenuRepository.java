package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MenuRepository extends JpaRepository<Menu, Long> {

    List<Menu> findByMenuGroupId(Long menuGroupId);
    void deleteByMenuGroupId(Long menuGroupId);
}

package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Menu;
import Qaru.Prj.domain.entity.MenuGroup;
import Qaru.Prj.domain.entity.Shop;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Map;

public interface MenuGroupRepository extends JpaRepository<MenuGroup, Long> {

    MenuGroup findByShop(Shop shop);
}

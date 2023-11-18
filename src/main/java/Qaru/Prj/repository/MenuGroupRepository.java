package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Menu;
import Qaru.Prj.domain.entity.MenuGroup;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MenuGroupRepository extends JpaRepository<MenuGroup, Long> {
}

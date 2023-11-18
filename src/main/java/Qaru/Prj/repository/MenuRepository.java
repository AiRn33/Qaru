package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MenuRepository extends JpaRepository<Menu, Long> {
}

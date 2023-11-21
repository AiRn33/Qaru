package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Order;
import Qaru.Prj.domain.entity.OrderMenu;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderMenuRepository extends JpaRepository<OrderMenu, Long> {
}

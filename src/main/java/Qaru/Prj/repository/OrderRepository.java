package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findByOrderMenuId(Long orderMenuId);
}

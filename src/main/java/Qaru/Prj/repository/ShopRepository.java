package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Shop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface ShopRepository extends JpaRepository<Shop, Long> {
}

package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

public interface ShopRepository extends JpaRepository<Shop, Long> {

    Optional<Shop> findByUserId(Long userId);

}

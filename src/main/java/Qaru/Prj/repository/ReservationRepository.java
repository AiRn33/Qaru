package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Reservation;
import Qaru.Prj.domain.entity.ShopOpen;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
}

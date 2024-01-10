package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Reservation;
import Qaru.Prj.domain.entity.ShopOpen;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
}

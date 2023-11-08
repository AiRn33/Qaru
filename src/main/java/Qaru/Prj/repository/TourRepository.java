package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Image;
import Qaru.Prj.domain.entity.Tour;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TourRepository extends JpaRepository<Tour, Long> {
}

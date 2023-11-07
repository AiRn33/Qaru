package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Image;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ImageRepository extends JpaRepository<Image, Long> {

    List<Image> findByImageGroupId(Long ImageGroupId);

    void deleteByImageGroupId(Long ImageGroupId);
}

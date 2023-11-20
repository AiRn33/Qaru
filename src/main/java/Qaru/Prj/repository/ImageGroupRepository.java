package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.ImageGroup;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ImageGroupRepository extends JpaRepository<ImageGroup, Long> {
}

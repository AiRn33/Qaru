package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.Comment;
import Qaru.Prj.domain.entity.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, Long> {
}

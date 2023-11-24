package Qaru.Prj.repository;

import Qaru.Prj.domain.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByUserId(String userId);
    Optional<User> findByUserNickName(String userNickname);
    Optional<User> findByUserEmail(String userEmail);

    Optional<User> findByUserEmailAndUserId(String userEmail, String userId);
}

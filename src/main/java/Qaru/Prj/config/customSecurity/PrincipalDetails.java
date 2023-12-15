package Qaru.Prj.config.customSecurity;

import Qaru.Prj.domain.entity.User;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

@Data
public class PrincipalDetails implements UserDetails {

    private User user;

    // 일반 로그인 생성자
    public PrincipalDetails(User user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() { // User 권한을 리턴하는 메서드
        Collection<GrantedAuthority> collection = new ArrayList<>();
        collection.add(new SimpleGrantedAuthority("ROLE_" + user.getRole().toString()));
        return collection;
    }

    @Override
    public String getPassword() { // User 비밀번호 리턴
        return user.getUserPw();
    }

    @Override
    public String getUsername() { // User PK 또는 고유한 값을 리턴
        return user.getUserId();
    }

    @Override
    public boolean isAccountNonExpired() { // User 계정 만료 여부 리턴
        return true; // true : 만료 안됨
    }

    @Override
    public boolean isAccountNonLocked() { // User 계정 잠김 여부 리턴
        return true; // treu : 잠기지 않음
    }

    @Override
    public boolean isCredentialsNonExpired() { // User 비밀번호 만료 여부 리턴
        return true; // true : 만료 안됨
    }

    @Override
    public boolean isEnabled() { // User 계정 활성화 여부 리턴
        return true; // true : 활성화 됨
    }
}

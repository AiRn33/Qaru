package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.enums.UserType;
import Qaru.Prj.domain.enums.RoleType;
import Qaru.Prj.domain.request.UserUpdateRequest;
import lombok.Builder;
import lombok.Getter;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Entity
@Getter
@DynamicUpdate //변경된 필드만 적용
public class User implements UserDetails {

    @Id
    @GeneratedValue
    @Column(name = "user_id")
    private Long id;

    @Column(name = "user_account")
    private String userId;

    @Column(name = "user_pw")
    private String userPw;

    @Column(name = "user_nickname")
    private String userNickName;

    @Column(name = "user_email")
    private String userEmail;

    @Column(name = "role")
    @Enumerated(EnumType.STRING)
    private RoleType role;

    // 가입 = 0, 탈퇴 = 1
    @Column(name = "use_yn")
    private Boolean useYn;

    @Column(name = "user_social_type")
    @Enumerated(EnumType.STRING)
    private UserType userSocialType;

    @Embedded
    private DateTime dateTime;

    @Embedded
    private Address address;

    protected User(){

    }

    @Builder
    public User(String userId, String userPw,
                String userNickName, String userEmail,
                RoleType role, UserType userSocialType,
                DateTime dateTime, Address address) {
        this.userId = userId;
        this.userPw = userPw;
        this.userNickName = userNickName;
        this.userEmail = userEmail;
        this.role = role;
        this.useYn = false;
        this.userSocialType = userSocialType;
        this.dateTime = dateTime;
        this.address = address;
    }

    public User updateUser(UserUpdateRequest request){
        this.userNickName = request.getUserNickname();
        this.address = new Address(request.getUserCity(), request.getUserStreet(), request.getUserZipcode());
        this.dateTime = new DateTime().userUpdateTime(this);
        return this;
    }

    public User updateRole(){
        this.role = RoleType.ADMIN;
        return this;
    }

    public User updatePassword(String password){
        this.userPw = password;
        return this;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        Collection<GrantedAuthority> collectors = new ArrayList<>();
        collectors.add(new GrantedAuthority() {

            @Override
            public String getAuthority() {
                return "ROLE_"+ role;   // ROLE_USER
            }
        });

        return collectors;    }

    @Override
    public String getPassword() {
        return null;
    }

    @Override
    public String getUsername() {
        return null;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}

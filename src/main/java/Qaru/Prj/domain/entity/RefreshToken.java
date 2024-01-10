package Qaru.Prj.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Getter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
public class RefreshToken {

    @Id
    @GeneratedValue
    @Column(name = "refresh_token_id")
    private Long id;

    private String refreshToken;

    private Date expDate;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Builder
    public RefreshToken(Long id, String refreshToken, Date expDate, User user) {
        this.id = id;
        this.user = user;
        this.refreshToken = refreshToken;
        this.expDate = expDate;
    }

    public RefreshToken() {

    }
}

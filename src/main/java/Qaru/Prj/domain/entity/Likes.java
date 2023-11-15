package Qaru.Prj.domain.entity;

import lombok.Builder;
import lombok.Getter;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Getter
@DynamicUpdate //변경된 필드만 적용
public class Likes {

    @Id
    @GeneratedValue
    @Column(name = "likes_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_id")
    private Tour tour;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "comment_id")
    private Comment comment;

    protected Likes(){

    }

    @Builder
    public Likes(Long likes_id, User user, Tour tour, Comment comment) {
        this.id = likes_id;
        this.user = user;
        this.tour = tour;
        this.comment = comment;
    }
}

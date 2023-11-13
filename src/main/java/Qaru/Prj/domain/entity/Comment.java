package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.baseEntity.DateTime;
import lombok.Builder;
import lombok.Getter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
public class Comment {

    @Id
    @GeneratedValue
    @Column(name = "comment_id")
    private Long id;

    @Column(name = "comment_content")
    private String commentContent;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_id")
    private Tour tour;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    private Comment parent;

    @Embedded
    private DateTime dateTime;

    @Builder.Default
    @OneToMany(mappedBy = "parent", orphanRemoval = true)
    private List<Comment> children = new ArrayList<>();

    @Builder
    public Comment(Long id, String commentContent, User user, Tour tour, Comment parent, DateTime dateTime) {
        this.id = id;
        this.commentContent = commentContent;
        this.user = user;
        this.tour = tour;
        this.parent = parent;
        this.dateTime = dateTime;
    }

    protected Comment() {

    }
}

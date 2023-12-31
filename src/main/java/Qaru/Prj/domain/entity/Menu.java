package Qaru.Prj.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Getter;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

import static javax.persistence.CascadeType.*;

@Entity
@Getter
public class Menu {

    @Id
    @GeneratedValue
    @Column(name = "menu_id")
    private Long id;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "img_group_id")
    private ImageGroup imageGroup;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "menu_group_id")
    private MenuGroup menuGroup;

    @Column(name = "menu_name")
    private String menuName;

    @Column(name = "menu_comment")
    private String menuComment;

    protected Menu() {

    }

    @Builder
    public Menu(Long id, ImageGroup imageGroup, MenuGroup menuGroup, String menuName, String menuComment, Long menuPrice) {
        this.id = id;
        this.imageGroup = imageGroup;
        this.menuGroup = menuGroup;
        this.menuName = menuName;
        this.menuComment = menuComment;
        this.menuPrice = menuPrice;
    }

    @Column(name = "menu_price")
    private Long menuPrice;
}

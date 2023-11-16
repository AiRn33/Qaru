package Qaru.Prj.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Getter
@DynamicUpdate //변경된 필드만 적용
public class Menu {

    @Id
    @GeneratedValue
    @Column(name = "menu_id")
    private Long id;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "img_group_id")
    @Cascade(CascadeType.ALL)
    private ImageGroup imageGroup;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "menu_group_id")
    @Cascade(CascadeType.ALL)
    private MenuGroup menuGroup;

    @Column(name = "menu_name")
    private String menuName;

    @Column(name = "menu_comment")
    private String menuComment;

    @Column(name = "menu_price")
    private Long menuPrice;
}

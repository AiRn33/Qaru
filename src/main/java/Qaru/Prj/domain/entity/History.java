package Qaru.Prj.domain.entity;

import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.enums.ContentType;
import Qaru.Prj.domain.enums.UserType;

import javax.persistence.*;

@Entity
public class History {

    @Id
    @GeneratedValue
    private Long id;

    private Long userId;
    @Enumerated(EnumType.STRING)
    private ContentType contentType;

    private Long contentId;

    @Embedded
    private DateTime dateTime;
}

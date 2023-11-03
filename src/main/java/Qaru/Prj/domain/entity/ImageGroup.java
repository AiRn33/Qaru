package Qaru.Prj.domain.entity;


import Qaru.Prj.domain.baseEntity.DateTime;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class ImageGroup {

    @Id
    @GeneratedValue
    @Column(name = "img_group_id")
    private Long id;

    @Embedded
    private DateTime dateTime;
}

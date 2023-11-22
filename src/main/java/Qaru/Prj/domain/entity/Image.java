package Qaru.Prj.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Getter;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;

@Entity
@Getter
@DynamicUpdate //변경된 필드만 적용
public class Image {

    @Id
    @GeneratedValue
    @Column(name = "image_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "image_group_id")
    private ImageGroup imageGroup;

    @Column(name = "original_file_name")
    private String originalFileName;

    @Column(name = "stored_file_name")
    private String storedFileName;

    @Column(name = "stored_file_path")
    private String storedFilePath;

    protected Image(){

    }

    @Builder
    public Image(ImageGroup imageGroup, String originalFileName, String storedFileName, String storedFilePath) {
        this.imageGroup = imageGroup;
        this.originalFileName = originalFileName;
        this.storedFileName = storedFileName;
        this.storedFilePath = storedFilePath;
    }
}

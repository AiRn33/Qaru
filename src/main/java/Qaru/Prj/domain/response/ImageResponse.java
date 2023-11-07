package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.Image;
import lombok.Getter;

@Getter
public class ImageResponse {

    private String originalFileName;
    private String storedFileName;
    private String storedFilePath;

    private String srcName;

    public String createSrc(){
        return this.storedFilePath + this.storedFileName;
    }

    public ImageResponse selectImage(Image image){
        this.originalFileName = image.getOriginalFileName();
        this.storedFileName = image.getStoredFileName();
        this.storedFilePath = image.getStoredFilePath();
        this.srcName = createSrc();
        return this;
    }
}

package Qaru.Prj.service;

import Qaru.Prj.domain.entity.Image;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.repository.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
public class ImageService {

    @Value("${app.upload.dir}")
    private String dir;

    private final ImageRepository imageRepository;

    public void imageSave(MultipartFile file, String storedName, Shop shop){

        String originalName = file.getOriginalFilename();

        Image image = Image.builder()
                .imageGroup(shop.getImageGroup())
                .originalFileName(originalName)
                .storedFilePath(dir)
                .storedFileName(storedName)
                .build();

        imageRepository.save(image);
    }
}

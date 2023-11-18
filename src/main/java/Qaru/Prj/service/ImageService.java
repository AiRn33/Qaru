package Qaru.Prj.service;

import Qaru.Prj.domain.entity.Image;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.repository.ImageGroupRepository;
import Qaru.Prj.repository.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ImageService {

    @Value("${app.upload.dir}")
    private String dir;

    private final ImageRepository imageRepository;
    private final ImageGroupRepository imageGroupRepository;

    public Long imageSave(MultipartFile file, String storedName, ImageGroup imageGroup){

        String originalName = file.getOriginalFilename();
        imageGroupRepository.save(imageGroup);

        Image image = Image.builder()
                .imageGroup(imageGroup)
                .originalFileName(originalName)
                .storedFilePath(dir)
                .storedFileName(storedName)
                .build();

        return imageRepository.save(image).getImageGroup().getId();
    }

    public void imageSaveAll(List<MultipartFile> file, List<String> storedNames, ImageGroup imageGroup){

        List<Image> list = new ArrayList<>();

        for(int i = 0; i < file.size(); i++){

            String originalName = file.get(i).getOriginalFilename();

            Image image = Image.builder()
                    .imageGroup(imageGroup)
                    .originalFileName(originalName)
                    .storedFilePath(dir)
                    .storedFileName(storedNames.get(i))
                    .build();

            list.add(image);
        }

        imageRepository.saveAll(list);
    }

    public List<Image> imageSelectAll(Long imageGroupId){

        List<Image> images = imageRepository.findByImageGroupId(imageGroupId);

        return images;
    }

    @Transactional
    public void imageDelete(Long imageGroupId){

        imageRepository.deleteByImageGroupId(imageGroupId);
    }
}

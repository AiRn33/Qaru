package Qaru.Prj.service;

import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.repository.ImageGroupRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ImageGroupService {

    private final ImageGroupRepository imageGroupRepository;

    public void imageGroupDateUpdate(Long imageGroupId){
        ImageGroup imageGroup = imageGroupRepository.findById(imageGroupId).get();
        imageGroup.updateImageGroup(imageGroup);

    }
}

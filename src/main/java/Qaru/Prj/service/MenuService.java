package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.*;
import Qaru.Prj.domain.request.MenuCreateRequest;
import Qaru.Prj.domain.response.ImageResponse;
import Qaru.Prj.domain.response.MenuListResponse;
import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.repository.*;
import Qaru.Prj.repository.Impl.MenuRepositoryImpl;
import Qaru.Prj.repository.Impl.ShopRepositoryImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.IOException;
import java.util.*;

@Service
@RequiredArgsConstructor
public class MenuService {

    private final MenuRepository menuRepository;
    private final ShopRepository shopRepository;
    private final MenuGroupRepository menuGroupRepository;
    private final MenuRepositoryImpl menuRepositoryImpl;
    private final FileService fileService;
    private final ImageGroupRepository imageGroupRepository;
    private final ImageRepository imageRepository;

    @Value("${app.upload.dir}")
    private String dir;
    
    @Transactional
    public List<Menu> createMenuAll(PrincipalDetails request, List<MenuCreateRequest> menuData) {

        List<Menu> list = new ArrayList<>();

        Shop shop = shopRepository.findByUserId(request.getUser().getId()).get();

        MenuGroup menuGroup = MenuGroup.builder()
                .shop(shop)
                .dateTime(new DateTime().createTime())
                .build();

        for (int i = 0; i < menuData.size(); i++) {
            Menu menu = Menu.builder()
                    .menuName(menuData.get(i).getMenuName())
                    .menuComment(menuData.get(i).getMenuComment())
                    .menuPrice(Long.valueOf(menuData.get(i).getMenuPrice()))
                    .menuGroup(menuGroup)
                    .imageGroup(imageGroupRepository.findById(Long.valueOf(menuData.get(i).getImageGroupId())).get())
                    .build();

            list.add(menu);
        }

        List<Menu> menus = menuRepository.saveAll(list);

        if (menus.size() > 0) {
            shop.updateMenuCheck();

            if (menuData.get(0).getMenuViewCheck().equals("true")) {
                shop.updateMenuView();
            }
        }

        return menus;
    }

    public List<MenuListResponse> getMenuList(Long id, PrincipalDetails request) {

        List<MenuListResponse> menuList = menuRepositoryImpl.findByshopId(id);

        for (int i = 0; i < menuList.size(); i++) {
            List<Image> imageList = imageRepository.findByImageGroupId(menuList.get(i).getImageGroupId());
            for (int j = 0; j < imageList.size(); j++) {
                menuList.get(i).setStoredFileName(imageList.get(j).getStoredFileName());
                menuList.get(i).setStoredFilePath(imageList.get(j).getStoredFilePath());
            }
        }

        return menuList;
    }

    public List<Long> modifyMenuImages(List<MultipartFile> file, Long id) throws IOException {

        List<Long> imageGroupIdList = new ArrayList<>();
        List<Long> deleteImageGroupIdList = new ArrayList<>();

        List<MenuListResponse> menuList = menuRepositoryImpl.findByshopId(id);

        for(int i = 0; i < menuList.size(); i++){
            deleteImageGroupIdList.add(menuList.get(i).getImageGroupId());
        }


        int fileSize = file.size();

        for (int i = 0; i < fileSize; i++) {
            String fileOriginalName = file.get(i).getOriginalFilename().split("/")[0];
            Long fileGroupId = Long.valueOf(file.get(i).getOriginalFilename().split("/")[1]);

            if (fileGroupId < 1) {
                // 새로운 파일
                ImageGroup newImageGroup = createImageGroup();
                Long imageGroupId = saveImage(file.get(i), newImageGroup);
                imageGroupIdList.add(imageGroupId);
            } else if (fileOriginalName.equals(" ")) {
                // 기존 파일 가져가기
                ImageGroup newImageGroup = createImageGroup();
                Image image = getImage(fileGroupId);

                image.modifyImage(image, newImageGroup);

                Image saveImage = imageRepository.save(image);
                imageGroupIdList.add(saveImage.getImageGroup().getId());
            } else {
                // 새로운 파일
                ImageGroup newImageGroup = createImageGroup();
                Image image = getImage(fileGroupId);

                // 기존 파일 삭제
                fileService.deleteFile(image.getStoredFileName());

                // 새로운 파일 저장
                Long imageGroupId = saveImage(file.get(i), newImageGroup);
                imageGroupIdList.add(imageGroupId);
            }
        }

        deleteImages(deleteImageGroupIdList);

        return imageGroupIdList;
    }
    public Long saveImage(MultipartFile file, ImageGroup imageGroup) throws IOException {
        String storedFileName = fileService.serverUploadFileModify(file);
        Image saveImage = Image.builder()
                .imageGroup(imageGroup)
                .storedFileName(storedFileName)
                .storedFilePath(dir)
                .originalFileName(file.getOriginalFilename().split("/")[0])
                .build();
        Image saveImages = imageRepository.save(saveImage);
        return saveImages.getImageGroup().getId();
    }
    public void deleteImages(List<Long> imageGroupIds){
        imageGroupIds.forEach(imageGroupId -> {
            imageGroupRepository.deleteById(imageGroupId);
        });
    }
    
    public ImageGroup createImageGroup(){
        return imageGroupRepository.save(ImageGroup.builder().dateTime(new DateTime().createTime()).build());
    }
    
    public Image getImage(Long imageGroupId){
        return imageRepository.findByImageGroupId(imageGroupId).get(0);
    }
}

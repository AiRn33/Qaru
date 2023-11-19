package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.*;
import Qaru.Prj.domain.request.MenuCreateRequest;
import Qaru.Prj.domain.response.MenuListResponse;
import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.repository.*;
import Qaru.Prj.repository.Impl.MenuRepositoryImpl;
import Qaru.Prj.repository.Impl.ShopRepositoryImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MenuService {

    private final MenuRepository menuRepository;
    private final ShopRepository shopRepository;
    private final MenuGroupRepository menuGroupRepository;
    private final MenuRepositoryImpl menuRepositoryImpl;
    private final ImageGroupRepository imageGroupRepository;
    private final ImageRepository imageRepository;

    @Transactional
    public List<Menu> createMenuAll(PrincipalDetails request, List<MenuCreateRequest> menuData) {

        List<Menu> list = new ArrayList<>();

        Shop shop = shopRepository.findByUserId(request.getUser().getId()).get();

        MenuGroup menuGroup = MenuGroup.builder()
                .shop(shop)
                .dateTime(new DateTime().createTime())
                .build();

        for(int i = 0; i < menuData.size(); i++){
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

        if(menus.size() > 0){
            shop.updateMenuCheck();

            if(menuData.get(0).getMenuViewCheck().equals("true")){
                shop.updateMenuView();
            }
        }

        return menus;
    }

    public List<MenuListResponse> getMenuList(Long id, PrincipalDetails request) {

        List<MenuListResponse> menuList = menuRepositoryImpl.findByshopId(id);

        for (int i = 0; i < menuList.size(); i++) {
            List<Image> imageList = imageRepository.findByImageGroupId(menuList.get(i).getImageGroupId());
            for(int j = 0; j < imageList.size(); j++){
                menuList.get(i).setStoredFileName(imageList.get(j).getStoredFileName());
                menuList.get(i).setStoredFilePath(imageList.get(j).getStoredFilePath());
            }
        }

        return menuList;
    }
}

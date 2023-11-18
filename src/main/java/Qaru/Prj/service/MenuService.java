package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.Menu;
import Qaru.Prj.domain.entity.MenuGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.request.MenuCreateRequest;
import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.repository.*;
import Qaru.Prj.repository.Impl.ShopRepositoryImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MenuService {

    private final MenuRepository menuRepository;
    private final ShopRepository shopRepository;
    private final MenuGroupRepository menuGroupRepository;
    private final ImageGroupRepository imageGroupRepository;

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
        return menuRepository.saveAll(list);
    }
}

package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.request.ShopUpdateRequest;
import Qaru.Prj.domain.request.UserAdminChangeRequest;
import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.domain.response.TourListResponse;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import Qaru.Prj.repository.ImageRepository;
import Qaru.Prj.repository.Impl.ShopRepositoryImpl;
import Qaru.Prj.repository.Impl.UserRepositoryImpl;
import Qaru.Prj.repository.ShopRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShopService {

    private final UserRepository userRepository;
    private final ShopRepository shopRepository;
    private final ImageService imageService;
    private final UserRepositoryImpl userRepositoryImpl;
    private final ImageGroupService imageGroupService;
    private final ShopRepositoryImpl shopRepositoryImpl;


    public Long createAdmin(UserAdminChangeRequest userRequest, String storedName, PrincipalDetails request) {

        Optional<User> user = userRepository.findByUserId(request.getUsername());

        Shop shop = shopRepository.save(userRequest.toEntity(user.get(), new ImageGroup(new DateTime().createTime())));

        user.get().updateRole();

        imageService.imageSave(userRequest.getFile(), storedName, shop.getImageGroup());

        return shop.getId();
    }

    @Transactional
    public void updateShop(ShopUpdateRequest userRequest, PrincipalDetails request) {

        Shop shop = shopRepository.findByUserId(request.getUser().getId()).get();

        shop.updateShop(userRequest, shop);

        imageGroupService.imageGroupDateUpdate(shop.getImageGroup().getId());
    }

    public Page<ShopListResponse> searchShopListAll(Pageable pageable){

        Page<ShopListResponse> shopListResponses = shopRepositoryImpl.searchPage(pageable);

        return shopListResponses;
    }

    public Long searchTourListAllCount(){

        return shopRepositoryImpl.searchPageCount();
    }
}

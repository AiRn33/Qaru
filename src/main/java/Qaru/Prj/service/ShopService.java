package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.ShopOpen;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.request.ShopUpdateRequest;
import Qaru.Prj.domain.request.UserAdminChangeRequest;
import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.domain.response.ShopRervationListResponse;
import Qaru.Prj.domain.response.TourListResponse;
import Qaru.Prj.domain.response.UserAdminUpdateResponse;
import Qaru.Prj.repository.ImageRepository;
import Qaru.Prj.repository.Impl.ReservationRepositoryImpl;
import Qaru.Prj.repository.Impl.ShopRepositoryImpl;
import Qaru.Prj.repository.Impl.UserRepositoryImpl;
import Qaru.Prj.repository.ShopOpenRepository;
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
    private final ShopOpenRepository shopOpenRepository;
    private final ReservationRepositoryImpl reservationRepositoryImpl;


    public Long createAdmin(UserAdminChangeRequest userRequest, String storedName, PrincipalDetails request) {

        Optional<User> user = userRepository.findByUserId(request.getUsername());

        Shop shop = shopRepository.save(userRequest.toEntity(user.get(), imageGroupService.createImageGroup()));

        user.get().updateRole();

        imageService.imageSave(userRequest.getFile(), storedName, shop.getImageGroup());

        shopOpenRepository.save(new ShopOpen().createShopOpen(userRequest, shop));

        return shop.getId();
    }

    @Transactional
    public void updateShop(ShopUpdateRequest userRequest, PrincipalDetails request) {

        Shop shop = shopRepository.findByUserId(request.getUser().getId()).get();

        shop.updateShop(userRequest, shop);

        shopOpenRepository.findByShopId(shop.getId()).updateShopOpen(userRequest, shop);

        imageGroupService.imageGroupDateUpdate(shop.getImageGroup().getId());
    }

    public Page<ShopListResponse> shopListAll(Pageable pageable){

        Page<ShopListResponse> shopListResponses = shopRepositoryImpl.searchPage(pageable);

        return shopListResponses;
    }

    public Long searchTourListAllCount(){

        return shopRepositoryImpl.searchPageCount();
    }

    public ShopListResponse shopDataByUserId(Long id) {

        return shopRepositoryImpl.shopDataByUserId(id);
    }

    public ShopListResponse shopDataByShopId(Long id) {

        return shopRepositoryImpl.shopDataByShopId(id);
    }

    public Shop getShop(PrincipalDetails request) {

        if(!shopRepository.findByUserId(request.getUser().getId()).isPresent()){
            return null;
        }

        return shopRepository.findByUserId(request.getUser().getId()).get();
    }

    public List<ShopListResponse> searchShopListAll(String searchType, String searchContent) {

        return shopRepositoryImpl.searchShopList(searchType, searchContent);

    }

    public void searchReservationList(Long id, String date) {
        List<ShopRervationListResponse> shopRervationListResponses = reservationRepositoryImpl.searchReservation(id, date);

        System.out.println("========= > : " + shopRervationListResponses.size());
    }
}

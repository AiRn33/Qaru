package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.*;
import Qaru.Prj.domain.enums.ReservationType;
import Qaru.Prj.domain.request.ReservationDataRequest;
import Qaru.Prj.domain.request.ShopUpdateRequest;
import Qaru.Prj.domain.request.UserAdminChangeRequest;
import Qaru.Prj.domain.response.*;
import Qaru.Prj.repository.*;
import Qaru.Prj.repository.Impl.ReservationRepositoryImpl;
import Qaru.Prj.repository.Impl.ShopRepositoryImpl;
import Qaru.Prj.repository.Impl.UserRepositoryImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;
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
    private final ReservationRepository reservationRepository;
    private final ReservationRepositoryImpl reservationRepositoryImpl;


    @Transactional
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

    public ShopRervationListResponse searchReservationList(Long id, String date) {

        ShopRervationListResponse shopRervationListResponse = reservationRepositoryImpl.searchReservation(id, date).shopOpenTimeSet();

        List<ReservationYnCheckResponse> reservationList = reservationRepositoryImpl.reservationCheck(id, date);

        if(reservationList.size() > 0 && shopRervationListResponse.getReservationTime() > 30){
            List<ReservationYnCheckResponse> reservationListResult = new ArrayList<>();
            Long reservationTimeCheck = (long) (shopRervationListResponse.getReservationTime()==60?0 : 30);
            for(int i = 0; i < reservationList.size(); i++){
                if(reservationList.get(i).getReservationTime().getMinute() == reservationTimeCheck){
                    reservationListResult.add(reservationList.get(i));
                }
            }

            shopRervationListResponse.setReservationCheck(reservationListResult);
        }else if(reservationList.size() > 0){
            shopRervationListResponse.setReservationCheck(reservationList);
        }

        return shopRervationListResponse;
    }

    public ReservationDataResponse reservationSave(ReservationDataRequest request, Long userId, Long shopId) {

        User user = userRepository.findById(userId).get();

        Shop shop = shopRepository.findById(shopId).get();

        return new ReservationDataResponse().responseSet(reservationRepository.save(request.toEntity(request, user, shop)));
    }

    public List<ReservationListResponse> reservationList(PrincipalDetails request){

        List<ReservationListResponse> reservationListResponses = reservationRepositoryImpl.myReservationList(request.getUser().getId());

        for(int i = 0; i < reservationListResponses.size(); i++){
            reservationListResponses.get(i).setTime();
        }

        return reservationListResponses;
    }

    public String reservationMsg(Long id) {

        return reservationRepository.findById(id).get().getReservationMessage();
    }

    @Transactional
    public ReservationType reservationStatusChange(Long id) {

        Reservation reservation = reservationRepository.findById(id).get();

        reservation.reservationCancalChange();

        return reservation.getType();
    }
}

package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.request.UserAdminChangeRequest;
import Qaru.Prj.repository.ImageRepository;
import Qaru.Prj.repository.ShopRepository;
import Qaru.Prj.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShopService {

    private final UserRepository userRepository;
    private final ShopRepository shopRepository;

    private final ImageRepository imageRepository;

    private final ImageService imageService;


    public Long createAdmin(UserAdminChangeRequest userRequest, String storedName, PrincipalDetails request) {

        Optional<User> user = userRepository.findByUserId(request.getUsername());

        Shop shop = shopRepository.save(userRequest.toEntity(user.get(), new ImageGroup(new DateTime().createTime())));

        user.get().updateRole();

        imageService.imageSave(userRequest.getFile(), storedName, shop);

        return shop.getId();
    }
}

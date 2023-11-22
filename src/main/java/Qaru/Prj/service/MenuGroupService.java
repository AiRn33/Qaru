package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.*;
import Qaru.Prj.domain.request.MenuCreateRequest;
import Qaru.Prj.domain.response.MenuListResponse;
import Qaru.Prj.repository.*;
import Qaru.Prj.repository.Impl.MenuRepositoryImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuGroupService {

    private final MenuGroupRepository menuGroupRepository;

    public MenuGroup createMenuGroup(Shop shop){

        MenuGroup menuGroup = MenuGroup.builder()
                .shop(shop)
                .dateTime(new DateTime().createTime())
                .build();

        return menuGroupRepository.save(menuGroup);
    }
}

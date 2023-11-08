package Qaru.Prj;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.baseEntity.DateTime;
import Qaru.Prj.domain.entity.*;
import Qaru.Prj.domain.enums.RoleType;
import Qaru.Prj.domain.enums.UserType;

public class CreateClass {
    public User createUser() {
        // 유저 저장
        return User.builder()
                .userId("test12355")
                .userPw("1234")
                .userNickName("nickname123")
                .userEmail("test155155@naver.com")
                .userSocialType(UserType.NOMAL)
                .dateTime(new DateTime().createTime())
                .role(RoleType.USER)
                .build();
    }

    public Shop createShop(User user, ImageGroup imageGroup) {
        // 가게 저장
        return Shop.builder()
                .shopName("shopName")
                .user(user)
                .imageGroup(imageGroup)
                .shopComment("shopComment")
                .address(new Address("city", "street", "00000"))
                .dateTime(new DateTime().createTime())
                .build();
    }

    public ImageGroup createImgGroup() {
        // 이미지 그룹 저장
        return ImageGroup.builder()
                .dateTime(new DateTime().createTime())
                .build();
    }

    public Image createImg(ImageGroup imageGroup) {

        String fileName = "fileName";

        return Image.builder()
                .imageGroup(imageGroup)
                .originalFileName(fileName)
                .storedFileName("storedFileName")
                .storedFilePath("C:/file")
                .build();
    }

    public Tour createTour(ImageGroup imageGroup, User user){

        return Tour.builder()
                .user(user)
                .imageGroup(imageGroup)
                .tourTitle("여행 타이틀")
                .tourContent("여행 내용!!!")
                .address(new Address("city", "street", "00000"))
                .dateTime(new DateTime().createTime())
                .build();
    }
}

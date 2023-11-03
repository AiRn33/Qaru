package Qaru.Prj.domain.response;

import Qaru.Prj.domain.baseEntity.Address;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.domain.enums.RoleType;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class UserMypageRespose {

    private String userId;
    private String userNickname;
    private String userEmail;
    private String userAddress;
    private String userStreet;
    private String userCity;
    private String userZipcode;
    private RoleType role;

    public UserMypageRespose userUpdate(User user){
        this.userId = user.getUserId();
        this.userNickname = user.getUserNickName();
        this.userEmail = user.getUserEmail();
        if (user.getAddress() != null){
            this.userAddress = user.getAddress().AddressToString();
            this.userCity = user.getAddress().getCity();
            this.userStreet = user.getAddress().getStreet();
            this.userZipcode = user.getAddress().getZipcode();
        }
        this.role = user.getRole();

        return this;
    }
}

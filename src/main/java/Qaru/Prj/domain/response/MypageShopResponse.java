package Qaru.Prj.domain.response;

import Qaru.Prj.domain.entity.Shop;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class MypageShopResponse {

    private Boolean menuViewCheck;
    private Long shopId;

    public MypageShopResponse mypageShop(Shop shop){
        if(shop == null){
            this.menuViewCheck = false;
            this.shopId = null;
        }else {
            this.menuViewCheck = shop.getMenuCheck();
            this.shopId = shop.getId();
        }
        return this;
    }
}

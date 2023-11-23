package Qaru.Prj.domain.response;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class ShopListResponse {

    private Long shopId;

    private String shopName;

    private String shopComment;

    private String shopType;

    private String shopCity;

    private String shopStreet;

    private Boolean menuView;

    private String storedFileName;
}

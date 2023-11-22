package Qaru.Prj.domain.response;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class ShopListResponse {

    private Long shop_id;

    private String shop_name;

    private String shop_comment;

    private String shop_type;

    private String shop_city;

    private String shop_street;

    private Boolean menu_view;

    private String stored_file_name;
}

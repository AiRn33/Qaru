package Qaru.Prj.domain.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TourSearchRequest {

    private String searchType;
    private String searchContent;
}

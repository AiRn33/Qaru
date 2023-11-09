package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.response.TourListResponse;
import org.springframework.data.domain.*;


public interface TourRepositoryCustom {

    Page<TourListResponse> searchPage(Pageable pageable);

    Long searchPageCount();
}

package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.response.TourListResponse;
import org.springframework.data.domain.*;

import java.util.List;


public interface TourRepositoryCustom {

    Page<TourListResponse> searchPage(Pageable pageable);

    Long searchPageCount();

    List<TourListResponse> searchData(String type, String content);
}

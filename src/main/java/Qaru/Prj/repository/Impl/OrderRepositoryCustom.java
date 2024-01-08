package Qaru.Prj.repository.Impl;

import Qaru.Prj.domain.response.OrderMenuCheckResponse;
import Qaru.Prj.domain.response.OrderStatisticsResponse;
import Qaru.Prj.domain.response.StatisticsMenuCountList;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderRepositoryCustom {

    Page<OrderStatisticsResponse> searchStatisticsList(Pageable pageable, Long userId, String startDate, String endDate);

    Long searchPageCount(Long userId, String startDate, String endDate);

    List<OrderMenuCheckResponse> findByOrderMenuId(Long orderMenuId);

    List<StatisticsMenuCountList> orderMenuStatisticsList(Long shopId);

}

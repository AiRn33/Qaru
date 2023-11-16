package Qaru.Prj.controller;

import Qaru.Prj.domain.response.ShopListResponse;
import Qaru.Prj.domain.response.TourListResponse;
import Qaru.Prj.repository.Impl.ShopRepositoryImpl;
import Qaru.Prj.service.ShopService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.data.domain.Pageable;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ShopController {

    private final ShopService shopService;

    @GetMapping("/shop/shopList")
    public String shopList(Pageable pageable, Model model){

        List<ShopListResponse> tourListResponses =
                shopService.searchShopListAll(pageable).toList();

        if (tourListResponses.size() > 0) {
            model.addAttribute("shopList", tourListResponses);
            model.addAttribute("shopListCount", shopService.searchTourListAllCount());

            int pageNum = 0;
            int searchPageAllNum = (int) (shopService.searchTourListAllCount() / pageable.getPageSize());
            if (shopService.searchTourListAllCount() % pageable.getPageSize() > 0) {
                searchPageAllNum++;
            }

            // 페이지 num 이 3보다 작을 경우 1부터 시작하게 셋팅
            if (pageable.getPageNumber() < 3) {
                pageNum = 0;
            } else if (searchPageAllNum < 6) {
                pageNum = 0;
            } else if (pageable.getPageNumber() + 3 > searchPageAllNum) {
                pageNum = (searchPageAllNum) - 5;
                if (pageNum < 1) {
                    pageNum = 0;
                }
            } else {
                pageNum = pageable.getPageNumber() - 2;
            }

            int endPageNum = 0;

            // 즉 3페이지 이전일 때
            if (pageNum == 0) {
                // 전체 페이지가 5 페이지 이상일 경우
                if (searchPageAllNum > 4) {
                    endPageNum = 4;
                } else {
                    endPageNum = searchPageAllNum - 1;
                }
            } else {
                if (searchPageAllNum < 6) {
                    endPageNum = searchPageAllNum - 1;
                } else if (pageable.getPageNumber() + 3 > searchPageAllNum) {
                    endPageNum = searchPageAllNum - 1;
                } else {
                    endPageNum = pageable.getPageNumber() + 2;
                }
            }

            model.addAttribute("pageNum", pageNum);
            model.addAttribute("endPageNum", endPageNum);

        } else {
            model.addAttribute("shopListCount", shopService.searchTourListAllCount());
        }
        return "/shop/shopList";
    }
}

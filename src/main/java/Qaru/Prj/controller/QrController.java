package Qaru.Prj.controller;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.response.TourListResponse;
import Qaru.Prj.service.TourService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class QrController {

    private final TourService tourService;

    @GetMapping("/qr/createQr")
    public String createQr(){

        return "/qr/createQr";
    }

    @ResponseBody
    @GetMapping("/qr/tour")
    public List<TourListResponse> qrTourList(@AuthenticationPrincipal PrincipalDetails request){

        List<TourListResponse> tourListResponses = tourService.qrTourList(request);

        return tourListResponses;
    }
}

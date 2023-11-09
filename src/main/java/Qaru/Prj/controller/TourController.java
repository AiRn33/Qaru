package Qaru.Prj.controller;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.request.TourCreateRequest;
import Qaru.Prj.domain.response.TourListResponse;
import Qaru.Prj.domain.response.TourViewResponse;
import Qaru.Prj.error.ScriptErrors;
import Qaru.Prj.service.FileService;
import Qaru.Prj.service.ImageService;
import Qaru.Prj.service.TourService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import javax.validation.Valid;
import org.springframework.data.domain.Pageable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class TourController {

    private final TourService tourService;
    private final ImageService imageService;
    private final FileService fileService;

    @GetMapping("/tour/tourList")
    public String tourList(Pageable pageable, Model model){

        List<TourListResponse> tourListResponses =
                tourService.searchTourListAll(pageable).toList();

        if(tourListResponses.size() > 0){
            model.addAttribute("tourList", tourListResponses);
            model.addAttribute("tourListCount", tourService.searchTourListAllCount());
        }else{
            model.addAttribute("tourListCount", tourService.searchTourListAllCount());
        }

        return "/tour/tourList";
    }

    @GetMapping("/tour")
    public String createTourForm(){

        return "/tour/createTour";
    }

    @PostMapping("/tour")
    public String createTourPost(@Valid TourCreateRequest request, BindingResult bindingResult, Model model,
                                 @AuthenticationPrincipal PrincipalDetails principalDetails) throws IOException {

        System.out.println("======> : " + request.toString());
        // valid에 걸릴 시
        if(bindingResult.hasErrors() || request.getFile().get(0).getSize() < 1){
            List errors = new ScriptErrors().errors(bindingResult);
            model.addAttribute("errorScript", errors);
            model.addAttribute("tourData", request);
            model.addAttribute("commentCheck", request.getTourContent().length() < 1 ? true : false);
            model.addAttribute("errorScriptImg", "[이미지를 다시 등록해주세요., img]");

            return "/tour/createTour";
        }

        ImageGroup imageGroup = tourService.createTour(principalDetails, request);
        List<String> storedNames = new ArrayList<>();
        for(int i = 0; i < request.getFile().size(); i++){
            String storedName = fileService.serverUploadFile(request.getFile().get(i));
            storedNames.add(storedName);
        }

        imageService.imageSaveAll(request.getFile(), storedNames ,imageGroup);

        model.addAttribute("successAlert", 4);

        return "/successAlert";
    }

    @GetMapping("/tour/{id}")
    public String tourView(@PathVariable Long id, Model model) throws Exception {

        System.out.println("===========> : " + id);

        TourViewResponse view = tourService.getTour(id);
        System.out.println("========> : " + view);
        model.addAttribute("tour", view);

        return "/tour/view";
    }

}

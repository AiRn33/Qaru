package Qaru.Prj.controller;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.request.TourCreateRequest;
import Qaru.Prj.error.ScriptErrors;
import Qaru.Prj.service.FileService;
import Qaru.Prj.service.ImageService;
import Qaru.Prj.service.TourService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
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
    public String tourList(){
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
            model.addAttribute("errorScriptImg", "[이미지가 등록되지 않았습니다., img]");

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

}

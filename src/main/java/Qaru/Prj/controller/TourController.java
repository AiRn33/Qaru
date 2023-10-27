package Qaru.Prj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TourController {

    @GetMapping("/tour/tourList")
    public String tourList(){
        return "/tour/tourList";
    }
}

package Qaru.Prj.controller;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.Image;
import Qaru.Prj.domain.entity.ImageGroup;
import Qaru.Prj.domain.entity.Tour;
import Qaru.Prj.domain.request.TourCreateRequest;
import Qaru.Prj.domain.request.TourSearchRequest;
import Qaru.Prj.domain.response.CommentResponse;
import Qaru.Prj.domain.response.ImageResponse;
import Qaru.Prj.domain.response.TourListResponse;
import Qaru.Prj.domain.response.TourViewResponse;
import Qaru.Prj.error.ScriptErrors;
import Qaru.Prj.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import org.springframework.data.domain.Pageable;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class TourController {

    private final TourService tourService;
    private final ImageService imageService;
    private final FileService fileService;
    private final CommentService commentService;
    private final LikeService likeService;

    @GetMapping("/tour/tourList")
    public String tourList(Pageable pageable, Model model) {

        List<TourListResponse> tourListResponses =
                tourService.searchTourListAll(pageable).toList();

        if (tourListResponses.size() > 0) {
            model.addAttribute("tourList", tourListResponses);
            model.addAttribute("tourListCount", tourService.searchTourListAllCount());

            int pageNum = 0;
            int searchPageAllNum = (int) (tourService.searchTourListAllCount() / pageable.getPageSize());
            if (tourService.searchTourListAllCount() % pageable.getPageSize() > 0) {
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
            model.addAttribute("tourListCount", tourService.searchTourListAllCount());
        }

        return "/tour/tourList";
    }

    @GetMapping("/tour")
    public String createTourForm() {

        return "/tour/createTour";
    }

    @PostMapping("/tour")
    public String createTourPost(@Valid TourCreateRequest request, BindingResult bindingResult, Model model,
                                 @AuthenticationPrincipal PrincipalDetails principalDetails) throws IOException {

        // valid에 걸릴 시
        if (bindingResult.hasErrors() || request.getFile().get(0).getSize() < 1) {
            List errors = new ScriptErrors().errors(bindingResult);
            model.addAttribute("errorScript", errors);
            model.addAttribute("tourData", request);
            model.addAttribute("commentCheck", request.getTourContent().length() < 1 ? true : false);
            model.addAttribute("errorScriptImg", "[이미지를 다시 등록해주세요., img]");

            return "/tour/createTour";
        }

        ImageGroup imageGroup = tourService.createTour(principalDetails, request);
        List<String> storedNames = new ArrayList<>();
        for (int i = 0; i < request.getFile().size(); i++) {
            String storedName = fileService.serverUploadFile(request.getFile().get(i));
            storedNames.add(storedName);
        }

        imageService.imageSaveAll(request.getFile(), storedNames, imageGroup);

        model.addAttribute("successAlert", 4);

        return "/successAlert";
    }

    @GetMapping("/tour/{id}")
    public String tourView(@PathVariable Long id, Model model, @AuthenticationPrincipal PrincipalDetails request) throws Exception {

        TourViewResponse view = tourService.getTour(id);
        List<Image> imagesList = imageService.imageSelectAll(view.getImageGroup().getId());
        List<ImageResponse> images = new ArrayList<>();

        for (Image image : imagesList) {
            ImageResponse imageRes = new ImageResponse().selectImage(image);
            images.add(imageRes);
        }

        model.addAttribute("myTourCheck", view.getUserNickname().equals(request.getUser().getUserNickName()));
        model.addAttribute("tour", view);
        model.addAttribute("images", images);
        model.addAttribute("like", likeService.tourLikeCount(request, id));

        return "/tour/view";
    }

    @GetMapping("/tour/{id}/update")
    public String tourModify(@PathVariable Long id, @AuthenticationPrincipal PrincipalDetails request, Model model) throws Exception {

        TourViewResponse view = tourService.getTour(id);
        List<Image> imagesList = imageService.imageSelectAll(view.getImageGroup().getId());
        List<ImageResponse> images = new ArrayList<>();

        for (Image image : imagesList) {
            ImageResponse imageRes = new ImageResponse().selectImage(image);
            images.add(imageRes);
        }

        model.addAttribute("tour", view);
        model.addAttribute("images", images);

        return "/tour/modifyTour";
    }

    @PostMapping("/tour/{id}/update")
    public String tourModifyPost(@Valid TourCreateRequest request, BindingResult bindingResult,
                                 @AuthenticationPrincipal PrincipalDetails principalDetails,
                                 @PathVariable Long id, Model model) throws Exception {

        // valid에 걸릴 시
        if (bindingResult.hasErrors()) {
            List errors = new ScriptErrors().errors(bindingResult);
            model.addAttribute("errorScript", errors);
            model.addAttribute("tourData", request);
            model.addAttribute("commentCheck", request.getTourContent().length() < 1 ? true : false);
            model.addAttribute("errorScriptImg", "[이미지를 다시 등록해주세요., img]");

            return "/tour/modifyTour";
        }

        TourViewResponse tourViewResponse = tourService.updateTour(request, id);

        if (request.getFile().get(0).getSize() > 0) {
            List<String> storedNames = new ArrayList<>();
            for (int i = 0; i < request.getFile().size(); i++) {
                String storedName = fileService.serverUploadFile(request.getFile().get(i));
                storedNames.add(storedName);
            }
            imageService.imageDelete(tourViewResponse.getImageGroup().getId());
            imageService.imageSaveAll(request.getFile(), storedNames, tourViewResponse.getImageGroup());
        }

        List<Image> imagesList = imageService.imageSelectAll(tourViewResponse.getImageGroup().getId());
        List<ImageResponse> images = new ArrayList<>();

        for (Image image : imagesList) {
            ImageResponse imageRes = new ImageResponse().selectImage(image);
            images.add(imageRes);
        }

        model.addAttribute("tour", tourViewResponse);
        model.addAttribute("images", images);
        model.addAttribute("like", likeService.tourLikeCount(principalDetails, id));

        return "redirect:/tour/" + id;
    }

    @GetMapping("/tour/{id}/delete")
    public String tourDelete(@PathVariable Long id){

        tourService.deleteTour(id);

        return "redirect:/tour/tourList";
    }
    @ResponseBody
    @GetMapping("/tour/search")
    public List<TourListResponse> tourSearch(@RequestParam("searchType") String type, @RequestParam("searchContent") String content){

        List<TourListResponse> tourListResponses = tourService.searchData(type, content);

        return tourListResponses;
    }

    @ResponseBody
    @GetMapping("/tour/comment")
    public List<CommentResponse> commentRegist(@AuthenticationPrincipal PrincipalDetails request, @RequestParam("tourId") String tourId){

        List<CommentResponse> commentList = commentService.commentView(tourId, request);

        return commentList;
    }

    @ResponseBody
    @PostMapping("/tour/comment")
    public List<CommentResponse> commentView(@AuthenticationPrincipal PrincipalDetails request, @RequestParam("comment") String comment, @RequestParam("tourId") String tourId){

        List<CommentResponse> commentList = commentService.createComment(comment, tourId, request);

        return commentList;
    }

    @ResponseBody
    @PostMapping("/tour/recomment")
    public List<CommentResponse> recommentRegist(@AuthenticationPrincipal PrincipalDetails request,
                                                 @RequestParam("comment") String comment,
                                                 @RequestParam("tourId") String tourId,
                                                 @RequestParam("commentId") String commentId){

        List<CommentResponse> commentList = commentService.recreateComment(comment, tourId, commentId, request);

        return commentList;
    }

    @ResponseBody
    @PutMapping("/tour/comment/{id}")
    public List<CommentResponse> commentModify(@AuthenticationPrincipal PrincipalDetails request,
                                                 @RequestParam("comment") String comment,
                                                 @RequestParam("tourId") String tourId,
                                                 @PathVariable Long id){

        List<CommentResponse> commentResponses = commentService.commentUpdate(comment, id, tourId, request);

        return commentResponses;
    }

    @ResponseBody
    @DeleteMapping("/tour/comment/{id}")
    public List<CommentResponse> commentDelete(@AuthenticationPrincipal PrincipalDetails request,
                                               @RequestParam("tourId") String tourId,
                                               @PathVariable Long id){

        List<CommentResponse> commentResponses = commentService.commentDelete(id, tourId, request);

        return commentResponses;
    }

    @ResponseBody
    @PostMapping("/tour/like/{id}")
    public List<CommentResponse> tourLike(@AuthenticationPrincipal PrincipalDetails request,
                           @PathVariable Long id,
                         @RequestParam("likeCheck") Long likeCheck,
                         @RequestParam("tourCommentCheck") String check,
                         @RequestParam("tourId") Long tourId){
        Long count = 0L;

        List<CommentResponse> commentResponses = null;

        if(check.equals("tour")){
            if(likeCheck > 0){
                count = likeService.tourLikeRemove(request, id);
            }else{
                count = likeService.tourLikeAdd(request, id);
            }
        }else if(check.equals("comment")){

            if(likeCheck > 0){
                count = likeService.commentLikeRemove(request, id);
            }else{
                count = likeService.commentLikeAdd(request, id);
            }
        }
        commentResponses = commentService.commentSort(String.valueOf(tourId), request);
        commentResponses.get(0).updateTourLikeCount(count);
        return commentResponses;
    }
}

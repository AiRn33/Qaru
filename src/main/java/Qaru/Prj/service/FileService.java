package Qaru.Prj.service;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


@Service
public class FileService {
    /**
     * @param filename: 서버에 업로드되는 파일명
     * @param fileDir: 파일이 저장되는 경로
     */
    @Value("${app.upload.dir}")
    private String dir;
    public String getFullPath(String filename) {
        return dir + filename;
    }

    public String serverUploadFile(MultipartFile multipartFile) throws IOException {

        //파일 없으면 null 반환
        if (multipartFile.isEmpty()) {
            return null;
        }

        String originalFilename = multipartFile.getOriginalFilename(); //원래 파일명

        String serverUploadFileName = createServerFileName(originalFilename); //uuid 생성해서 뒤에 원래파일명의 확장자명 붙이기

        multipartFile.transferTo(new File(getFullPath(serverUploadFileName)));//저장: (서버에 업로드되는 파일명, 업로드 되는 경로)

        return serverUploadFileName;
    }

    public String serverUploadFileModify(MultipartFile multipartFile) throws IOException {

        //파일 없으면 null 반환
        if (multipartFile.isEmpty()) {
            return null;
        }

        String originalFilename = multipartFile.getOriginalFilename().split("/")[0]; //원래 파일명

        String serverUploadFileName = createServerFileName(originalFilename); //uuid 생성해서 뒤에 원래파일명의 확장자명 붙이기

        multipartFile.transferTo(new File(getFullPath(serverUploadFileName)));//저장: (서버에 업로드되는 파일명, 업로드 되는 경로)

        return serverUploadFileName;
    }

    //uuid 생성해서 뒤에 원래파일명의 확장자명 붙이기
    private String createServerFileName(String originalFilename) {
        String uuid = UUID.randomUUID().toString();
        String ext = extractExt(originalFilename);
        return uuid + "." + ext;
    }

    //원래 파일명에서 확장자 뽑기(.jpg, .png ...)
    private String extractExt(String originalFilename) {
        int pos = originalFilename.lastIndexOf(".");
        return originalFilename.substring(pos + 1);
    }

    public void deleteFile(String storedFileName){

        File file = new File(dir + storedFileName);
        file.delete();
    }
}
package com.project.platform.renting.core.service;

import com.project.platform.renting.core.model.Picture;
import org.springframework.web.multipart.MultipartFile;

public interface PictureService {

    Picture findById(int pictureId);
    Picture upload(int productId, MultipartFile file) throws Exception;
    void delete(int pictureId);
}

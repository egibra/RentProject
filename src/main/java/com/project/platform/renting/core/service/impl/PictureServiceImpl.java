package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.Picture;
import com.project.platform.renting.core.model.Product;
import com.project.platform.renting.core.repository.PictureRepository;
import com.project.platform.renting.core.service.PictureService;
import com.project.platform.renting.core.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class PictureServiceImpl implements PictureService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ProductService productService;

    @Value("${com.project.platform.renting.images-folder}")
    private String imagesFolderPath;

    @Autowired
    private PictureRepository repository;

    @Override
    public Picture findById(int pictureId) {
        return repository.findOne(pictureId);
    }

    @Override
    @Transactional(rollbackFor = {Exception.class})
    public Picture upload(int productId, MultipartFile file) throws Exception {
        Product product = productService.getById(productId);
        if (product == null) {
            throw new RuntimeException("Product not found");
        }
        Picture picture = new Picture();
        picture.setName(file.getOriginalFilename());
        picture.setProduct(product);
        repository.save(picture);
        int pictureId = picture.getId();
        String fileName = pictureId + ".png";
        picture.setFileName(fileName);
        Path path = Paths.get(imagesFolderPath + File.separator + fileName);
        repository.save(picture);
        Files.createDirectories(path.getParent());
        Files.write(path, file.getBytes());
        if(product.getMainPicture() == null){
            productService.setMainPicture(productId, pictureId);
        }
        return picture;
    }

    @Override
    public void delete(int pictureId) {
        Picture picture = repository.getOne(pictureId);
        Product product = picture.getProduct();
        //check if picture is set as a main picture
        if(product.getMainPicture() == picture){
            productService.setMainPicture(product.getId(), null);
        }
        repository.delete(pictureId);
        Path path = Paths.get(imagesFolderPath + File.separator + picture.getFileName());
        try {
            Files.delete(path);
        } catch (IOException e) {
            logger.error("IO exception when deleting picture {}", picture.getFileName(), e);
        }
    }
}

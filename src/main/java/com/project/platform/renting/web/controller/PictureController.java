package com.project.platform.renting.web.controller;


import com.project.platform.renting.core.service.PictureService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "${com.project.platform.renting.admin-url}")
public class PictureController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private PictureService pictureService;

    @Autowired
    public PictureController(PictureService pictureService) {
        this.pictureService = pictureService;
    }

    @Value("${com.project.platform.renting.admin-url}")
    private String adminUrl;

    @Value("${com.project.platform.renting.image-url}")
    private String imageUrl;

    @RequestMapping(value = "/picture/{productId}", method = RequestMethod.POST)
    public ResponseEntity upload(@PathVariable Integer productId, @RequestParam MultipartFile file) {
        if (!file.getContentType().equals("image/png")) {
            return new ResponseEntity<Object>("Failas turi būti png formato.", HttpStatus.BAD_REQUEST);
        }
        try {
            pictureService.upload(productId, file);
        } catch (Exception exception) {
            logger.error("Exception while uploading picture for product {}", productId, exception);
            return new ResponseEntity<Object>(exception.toString(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value = "/picture/{pictureId}", method = RequestMethod.DELETE)
    public ResponseEntity delete(@PathVariable Integer pictureId) {
        pictureService.delete(pictureId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}

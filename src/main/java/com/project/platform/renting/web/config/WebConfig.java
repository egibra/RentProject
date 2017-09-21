package com.project.platform.renting.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
@ComponentScan(basePackages = "com.project.platform.renting.web")
@PropertySource({"classpath:/tags.properties", "classpath:/pages.properties", "classpath:/generalJSP.properties"})
public class WebConfig extends WebMvcConfigurerAdapter {

    @Value("${com.project.platform.renting.image-url}")
    private String imageUrl;

    @Value("${com.project.platform.renting.images-folder}")
    private String imagesFolderPath;

    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        registry.addResourceHandler(imageUrl+"/**")
                .addResourceLocations("file:///"+imagesFolderPath);
    }
}
package com.project.platform.renting.core.config;


import com.project.platform.renting.web.config.BeanConfig;
import com.project.platform.renting.web.config.WebConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;

@Configuration
@ComponentScan(basePackages = "com.project.platform.renting.core")
@Import({BeanConfig.class, WebConfig.class})
@EnableAutoConfiguration
@EntityScan(value = "com.project.platform.renting.core.model",
        basePackageClasses = {Application.class, Jsr310JpaConverters.class})//for java 8 datetime classes
@EnableJpaRepositories("com.project.platform.renting.core.repository")
@EnableAsync
public class Application extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }

}
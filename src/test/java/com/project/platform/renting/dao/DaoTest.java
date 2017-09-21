package com.project.platform.renting.dao;

import com.project.platform.renting.config.TestConfiguration;
import com.project.platform.renting.core.config.Application;
import org.junit.runner.RunWith;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@DataJpaTest
@SpringBootTest(classes = {Application.class, TestConfiguration.class})
@ImportAutoConfiguration(exclude = FlywayAutoConfiguration.class)
public abstract class DaoTest {
}

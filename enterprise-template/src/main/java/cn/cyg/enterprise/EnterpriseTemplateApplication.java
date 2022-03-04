package cn.cyg.enterprise;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("cn.cyg.enterprise.dao")
@SpringBootApplication
public class EnterpriseTemplateApplication {
    public static void main(String[] args) {
        SpringApplication.run(EnterpriseTemplateApplication.class, args);
    }
}

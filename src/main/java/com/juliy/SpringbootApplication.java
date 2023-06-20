package com.juliy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

/**
 * @author juliy
 * @date 2023/3/1 13:23
 */
@SpringBootApplication
public class SpringbootApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext application = SpringApplication.run(SpringbootApplication.class, args);

        Environment env = application.getEnvironment();
        String activeProfile = env.getProperty("spring.profiles.active");
        // 开发环境打印信息
        if ("dev".equals(activeProfile)) {
            String port = env.getProperty("server.port");
            System.out.println("----------------------------------------------------------\n\t" +
                    "SHOKA-BLOG后端启动成功！\n\t" +
                    "Local访问网址: \t\thttp://localhost:" + port + "\n\t" +
                    "文档地址: \t\t\thttp://localhost:" + port + "/doc.html\n" +
                    "----------------------------------------------------------");
        }
    }
}

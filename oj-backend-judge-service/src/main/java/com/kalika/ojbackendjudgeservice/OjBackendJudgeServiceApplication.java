package com.kalika.ojbackendjudgeservice;

import com.kalika.ojbackendjudgeservice.rabbitmq.InitRabbitMq;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
@ComponentScan("com.kalika")
@EnableDiscoveryClient
@EnableFeignClients(basePackages = {"com.kalika.ojbackendserviceclient.service"})
@SpringBootApplication
public class OjBackendJudgeServiceApplication {
    public static void main(String[] args) {
        InitRabbitMq initRabbitMq = new InitRabbitMq();
        initRabbitMq.doInit(); // 初始化RabbitMQ
        SpringApplication.run(OjBackendJudgeServiceApplication.class, args);
    }

}

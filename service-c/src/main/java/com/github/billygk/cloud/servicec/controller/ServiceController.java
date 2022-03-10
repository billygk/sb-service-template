package com.github.billygk.cloud.servicec.controller;

import com.github.billygk.cloud.servicec.config.RabbitMqConfig;
import com.github.billygk.cloud.servicec.dto.JobDataDto;
import com.github.billygk.cloud.servicec.dto.JobDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.Instant;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(path = "service-c")
public class ServiceController {
    private final static Logger log = LoggerFactory.getLogger(ServiceController.class);
    private final RabbitTemplate rabbitTemplate;

    public ServiceController(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    @PostMapping(path = "queue-job")
    public ResponseEntity postQueueJob(@RequestBody JobDto jobDto) {
        log.info("adding new job...");
        rabbitTemplate.convertAndSend(
                RabbitMqConfig.EXCHANGE_NAME,
                RabbitMqConfig.ROUTING_KEY,
                jobDto
        );

        return ResponseEntity.ok(HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Map<String, String>> getHome(
            @RequestHeader MultiValueMap<String, String> headers,
            Principal principal
    ) {
        Map<String, String> response = new HashMap<>();
        response.put("path", "/service-c");
        response.put("timestamp", Instant.now().toString());
        response.putAll(headers.toSingleValueMap());
        if (principal != null) {
            response.put("Principal", principal.getName());
        }
        return ResponseEntity.ok(response);
    }

    @GetMapping(path = "/auth-user1")
    public ResponseEntity<Map<String, String>> getAuthUser1(
//            @RequestHeader HttpHeaders headers
            @RequestHeader MultiValueMap<String, String> headers
    ) {
        log.debug("=> /service-c/auth-user1");
        Map<String, String> response = new HashMap<>();
        response.put("path", "/service-c/auth-user1");
        response.put("timestamp", Instant.now().toString());
        response.putAll(headers.toSingleValueMap());
        return ResponseEntity.ok(response);
    }

    @GetMapping(path = "/auth-user2")
    public ResponseEntity<Map<String, String>> getAuthUser2(
//            @RequestHeader HttpHeaders headers
            @RequestHeader MultiValueMap<String, String> headers
    ) {
        log.debug("=> /service-c/auth-user1");
        Map<String, String> response = new HashMap<>();
        response.put("path", "/service-c/auth-user2");
        response.put("timestamp", Instant.now().toString());
        response.putAll(headers.toSingleValueMap());
        return ResponseEntity.ok(response);
    }
}

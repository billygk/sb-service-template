package com.github.billygk.cloud.servicea.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(path = "service-a")
public class ServiceController {
    private final static Logger log = LoggerFactory.getLogger(ServiceController.class);

    @GetMapping
    public ResponseEntity<Map<String, String>> getHome(
            @RequestHeader MultiValueMap<String, String> headers,
            Principal principal
    ) {
        log.debug("=> /service-a");
        Map<String, String> response = new HashMap<>();
        response.put("path", "/service-a");
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
        log.debug("=> /service-a/auth-user1");
        Map<String, String> response = new HashMap<>();
        response.put("path", "/service-a/auth-user1");
        response.put("timestamp", Instant.now().toString());
        response.putAll(headers.toSingleValueMap());
        return ResponseEntity.ok(response);
    }

    @GetMapping(path = "/auth-user2")
    public ResponseEntity<Map<String, String>> getAuthUser2(
//            @RequestHeader HttpHeaders headers
            @RequestHeader MultiValueMap<String, String> headers
    ) {
        log.debug("=> /service-a/auth-user1");
        Map<String, String> response = new HashMap<>();
        response.put("path", "/service-a/auth-user2");
        response.put("timestamp", Instant.now().toString());
        response.putAll(headers.toSingleValueMap());
        return ResponseEntity.ok(response);
    }
}

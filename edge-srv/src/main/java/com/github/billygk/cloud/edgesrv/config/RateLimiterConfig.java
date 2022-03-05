package com.github.billygk.cloud.edgesrv.config;

import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import reactor.core.publisher.Mono;

@Configuration
public class RateLimiterConfig {

    private final Environment env;

    public RateLimiterConfig(Environment env) {
        this.env = env;
    }

    @Bean
    KeyResolver keyResolver() {
        return exchange -> exchange.getPrincipal()
                .flatMap(p -> Mono.just(p.getName()))
                .defaultIfEmpty("ANONYMOUS");
    }

}

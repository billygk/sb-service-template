package com.github.billygk.cloud.servicea.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

@EnableWebSecurity
public class SecurityConfig {
    private final static Logger log = LoggerFactory.getLogger(SecurityConfig.class);
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        String[] publicUrls = new String[]{
                "/service-a",
        };
        String localHostV4 = "127.0.0.1";
        String localHostV6 = "0:0:0:0:0:0:0:1";

        http.authorizeRequests(authorize -> authorize
                .mvcMatchers( "/actuator/*").permitAll()
                .mvcMatchers( "/service-a").permitAll()
                .mvcMatchers( "/service-a/auth-user1").hasAnyRole("sbAdmin", "sbUser1")
                .mvcMatchers( "/service-a/auth-user2").hasAnyRole("sbAdmin", "sbUser2")
                .anyRequest().authenticated()
        );

        http.oauth2ResourceServer(OAuth2ResourceServerConfigurer::jwt)
                .sessionManagement(sessionManagement ->
                        sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS));

        http.csrf()
                .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
                .ignoringAntMatchers(publicUrls)
                .ignoringRequestMatchers(request ->
                        request.getRemoteHost().contains(localHostV4)
                                || request.getRemoteHost().contains(localHostV6));

        return http.build();

    }

    /*
      Spring boot security prefixes roles with "ROLE_" this Bean performs that conversion,
      so we can use spring boot security transparently.
     */
    @Bean
    public JwtAuthenticationConverter jwtAuthenticationConverter() {
        JwtAuthenticationConverter jwtConverter = new JwtAuthenticationConverter();
        jwtConverter.setJwtGrantedAuthoritiesConverter(new RealmRoleConverter());
        return jwtConverter;
    }

}

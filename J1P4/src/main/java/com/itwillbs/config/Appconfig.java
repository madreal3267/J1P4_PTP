package com.itwillbs.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource("classpath:application.properties")
public class Appconfig {
	
	@Value("${portone.api.key}")
    private String portOneApiKey;

    @Value("${portone.api.secret}")
    private String portOneApiSecret;

    @Bean
    public String portOneApiKey() {
        return portOneApiKey;
    }
    @Bean
    public String portOneApiSecret() {
        return portOneApiSecret;
    }
}

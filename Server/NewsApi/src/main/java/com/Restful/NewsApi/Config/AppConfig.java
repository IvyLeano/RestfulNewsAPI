package com.Restful.NewsAPI.Config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

@Configuration
public class AppConfig {

    @Value("${api.key}")
    private String apiKey;

    @Value("${base.url}")
    private String newsBaseUrl;

    @Bean(name="apiKey")
    public String getApiKey() {
        return apiKey;
    }

    @Bean(name="newsBaseUrl")
    public String getNewsBaseUrl() {
        return newsBaseUrl;
    }

    @Bean
    public RestTemplate getRestTemplate() {
        return new RestTemplate(new HttpComponentsClientHttpRequestFactory());
    }
}

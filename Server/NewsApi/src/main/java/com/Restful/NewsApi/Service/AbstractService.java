package com.Restful.NewsAPI.Service;

import org.springframework.web.client.RestTemplate;

public class AbstractService {
    protected RestTemplate restTemplate;
    protected String newsBaseUrl;
    protected String apiKey;

    public AbstractService(RestTemplate restTemplate, String newsBaseUrl, String apiKey) {
        this.restTemplate = restTemplate;
        this.newsBaseUrl = newsBaseUrl;
        this.apiKey = apiKey;
    }
}

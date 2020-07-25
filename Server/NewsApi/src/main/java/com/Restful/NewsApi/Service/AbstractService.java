package com.Restful.NewsAPI.Service;

import org.springframework.web.client.RestTemplate;

public class AbstractService {
    protected RestTemplate restTemplate;
    protected String newsBaseUrl;

    public AbstractService(RestTemplate restTemplate, String newsBaseUrl) {
        this.restTemplate = restTemplate;
        this.newsBaseUrl = newsBaseUrl;
    }
}

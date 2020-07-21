package com.Restful.NewsApi.Service;

import org.springframework.web.client.RestTemplate;

public class AbstractService {
    protected RestTemplate restTemplate;
    protected String baseUrl;

    public AbstractService(RestTemplate restTemplate, String baseUrl) {
        this.restTemplate = restTemplate;
        this.baseUrl = baseUrl;
    }
}

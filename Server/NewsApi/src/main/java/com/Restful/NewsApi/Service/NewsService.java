package com.Restful.NewsApi.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

@Service
public class NewsService extends AbstractService {

    @Autowired
    public NewsService(RestTemplate restTemplate, @Qualifier("newsBaseUrl") String baseURL) {
        super(restTemplate, baseURL);
    }

//    public NewsResponse getNewsBySource(String apiKey, String source) {
//
//    }
//
//    public NewsResponse getNewsByCountry(String apiKey, String countryCode) {
//
//    }
//
//    public NewsResponse getNewsByCategory(String apiKey, String category) {
//
//    }
}

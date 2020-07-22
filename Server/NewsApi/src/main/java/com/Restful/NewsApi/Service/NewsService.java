package com.Restful.NewsAPI.Service;

import com.Restful.NewsAPI.Model.NewsResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class NewsService extends AbstractService {

    @Autowired
    public NewsService(RestTemplate restTemplate, @Qualifier("newsBaseUrl") String baseURL) {
        super(restTemplate, baseURL);
    }

    public NewsResponse getNewsBySource(String apiKey, String source) {
        if (apiKey.isEmpty() || apiKey == null || source.isEmpty() || source == null) {
            throw new IllegalArgumentException();
        }
        NewsResponse newsResponse = new NewsResponse();
        HttpHeaders headers = new HttpHeaders();
        HttpEntity request = new HttpEntity(headers);
        Map<String, String> uriParameters = new HashMap();
        uriParameters.put("apiKey", apiKey);
        uriParameters.put("source", source);
        ResponseEntity<NewsResponse> response = restTemplate.exchange(baseUrl, HttpMethod.GET, request, NewsResponse.class, uriParameters);
        newsResponse = response.getBody();

        return newsResponse;
    }

    public NewsResponse getNewsByCountry(String apiKey, String countryCode) {
        if (apiKey.isEmpty() || apiKey == null || countryCode.isEmpty() || countryCode == null) {
            throw new IllegalArgumentException();
        }
        NewsResponse newsResponse = new NewsResponse();
        HttpHeaders headers = new HttpHeaders();
        HttpEntity request = new HttpEntity(headers);
        Map<String, String> uriParameters = new HashMap();
        uriParameters.put("apiKey", apiKey);
        uriParameters.put("countryCode", countryCode);
        ResponseEntity<NewsResponse> response = restTemplate.exchange(baseUrl, HttpMethod.GET, request, NewsResponse.class, uriParameters);
        newsResponse = response.getBody();

        return newsResponse;
    }

    public NewsResponse getNewsByCategory(String apiKey, String category) {
        if (apiKey.isEmpty() || apiKey == null || category.isEmpty() || category == null) {
            throw new IllegalArgumentException();
        }
        NewsResponse newsResponse = new NewsResponse();
        HttpHeaders headers = new HttpHeaders();
        HttpEntity request = new HttpEntity(headers);
        Map<String, String> uriParameters = new HashMap();
        uriParameters.put("apiKey", apiKey);
        uriParameters.put("category", category);
        ResponseEntity<NewsResponse> response = restTemplate.exchange(baseUrl, HttpMethod.GET, request, NewsResponse.class, uriParameters);
        newsResponse = response.getBody();

        return newsResponse;
    }
}

package com.Restful.NewsAPI.Service;

import com.Restful.NewsAPI.Model.NewsResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;
import static com.Restful.NewsAPI.Constants.*;

@Service
public class NewsService extends AbstractService {

    @Autowired
    public NewsService(RestTemplate restTemplate, @Qualifier("newsBaseUrl") String newsBaseURL) {
        super(restTemplate, newsBaseURL);
    }

    public NewsResponse getNewsBySource(String apiKey, String source) {  //TODO: service needs to be updated
        if (StringUtils.isEmpty(apiKey) || StringUtils.isEmpty(source)) {
            throw new IllegalArgumentException();
        }
        NewsResponse newsResponse;
        HttpHeaders headers = new HttpHeaders();
        HttpEntity request = new HttpEntity(headers);
        Map<String, String> uriParameters = new HashMap();
        uriParameters.put("apiKey", apiKey);
        uriParameters.put("source", source);
        ResponseEntity<NewsResponse> response = restTemplate.exchange(newsBaseUrl + TOP_HEADLINES_ENDPOINTS, HttpMethod.GET, request, NewsResponse.class, uriParameters);
        newsResponse = response.getBody();

        return newsResponse;
    }

    public NewsResponse getNewsByCountry(String apiKey, String countryCode) {
        if (StringUtils.isEmpty(apiKey) || StringUtils.isEmpty(countryCode)) {
            throw new IllegalArgumentException();
        }
        NewsResponse newsResponse;
        HttpHeaders headers = new HttpHeaders();
        HttpEntity request = new HttpEntity(headers);
        Map<String, String> uriParameters = new HashMap();
        uriParameters.put("apiKey", apiKey);
        uriParameters.put("countryCode", countryCode);
        ResponseEntity<NewsResponse> response = restTemplate.exchange(newsBaseUrl + TOP_HEADLINES_ENDPOINTS, HttpMethod.GET, request, NewsResponse.class, uriParameters);
        newsResponse = response.getBody();

        return newsResponse;
    }

    public NewsResponse getNewsByCategory(String apiKey, String category) {
        if (StringUtils.isEmpty(apiKey) || StringUtils.isEmpty(category)) {
            throw new IllegalArgumentException();
        }
        NewsResponse newsResponse;
        HttpHeaders headers = new HttpHeaders();
        HttpEntity request = new HttpEntity(headers);
        Map<String, String> uriParameters = new HashMap();
        uriParameters.put("apiKey", apiKey);
        uriParameters.put("category", category);
        ResponseEntity<NewsResponse> response = restTemplate.exchange(newsBaseUrl + TOP_HEADLINES_ENDPOINTS, HttpMethod.GET, request, NewsResponse.class, uriParameters);
        newsResponse = response.getBody();

        return newsResponse;
    }
}

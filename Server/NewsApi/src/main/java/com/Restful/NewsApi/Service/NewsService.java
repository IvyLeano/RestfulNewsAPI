package com.Restful.NewsAPI.Service;

import com.Restful.NewsAPI.CountryCodeEnum;
import com.Restful.NewsAPI.Model.NewsResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import static com.Restful.NewsAPI.Constants.TOP_HEADLINES_ENDPOINTS;

@Service
public class NewsService extends AbstractService {

    @Autowired
    public NewsService(RestTemplate restTemplate, @Qualifier("newsBaseUrl") String newsBaseURL, @Qualifier("apiKey") String apiKey) {
        super(restTemplate, newsBaseURL, apiKey);
    }

    public NewsResponse getNewsBySource(String source) {
        if (StringUtils.isEmpty(source)) {
            throw new IllegalArgumentException();
        }
        HttpHeaders requestHeaders = new HttpHeaders();
        requestHeaders.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(newsBaseUrl + TOP_HEADLINES_ENDPOINTS)
                .queryParam("apiKey", apiKey)
                .queryParam("Sources", source);
        ResponseEntity<NewsResponse> responseEntity = restTemplate.exchange(
                uriBuilder.toUriString(),
                HttpMethod.GET,
                requestEntity,
                NewsResponse.class
        );
        return responseEntity.getBody();
    }

    public NewsResponse getNewsByCategory(String category) {
        if (StringUtils.isEmpty(category)) {
            throw new IllegalArgumentException();
        }
        HttpHeaders requestHeaders = new HttpHeaders();
        requestHeaders.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(newsBaseUrl + TOP_HEADLINES_ENDPOINTS)
                .queryParam("apiKey", apiKey)
                .queryParam("Category", category);
        for (CountryCodeEnum countryCode : CountryCodeEnum.values()) {
            uriBuilder.queryParam("Country", countryCode);
        }
        ResponseEntity<NewsResponse> responseEntity = restTemplate.exchange(
                uriBuilder.toUriString(),
                HttpMethod.GET,
                requestEntity,
                NewsResponse.class
        );
        return responseEntity.getBody();
    }
}

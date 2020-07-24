package com.Restful.NewsAPI.Controller;

import com.Restful.NewsAPI.Model.NewsResponse;
import com.Restful.NewsAPI.Service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NewsController {
    private final NewsService newsService;

    @Autowired
    public NewsController(NewsService newsService) {
        this.newsService = newsService;
    }

    @GetMapping("/source{apiKey}{sources}")
    public ResponseEntity<NewsResponse> getNewsBySource(@PathVariable("apiKey") String apiKey, @PathVariable("sources") String source) {
        if (StringUtils.isEmpty(apiKey) || StringUtils.isEmpty(source)) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        try {
            NewsResponse newsResponse = newsService.getNewsBySource(apiKey, source);
            return ResponseEntity.status(HttpStatus.OK).body(newsResponse);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }

    @GetMapping("/country{apiKey}{country}")
    public ResponseEntity<NewsResponse> getNewsByCountry(@PathVariable("apiKey") String apiKey, @PathVariable("country") String country) {
        if (StringUtils.isEmpty(apiKey) || StringUtils.isEmpty(country)) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        try {
            NewsResponse newsResponse = newsService.getNewsByCountry(apiKey, country);
            return ResponseEntity.status(HttpStatus.OK).body(newsResponse);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }

    @GetMapping("/category{apiKey}{category}")
    public ResponseEntity<NewsResponse> getNewsByCategory(@PathVariable String apiKey, @PathVariable String category) {
        if (StringUtils.isEmpty(apiKey) || StringUtils.isEmpty(category)) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        try {
            NewsResponse newsResponse = newsService.getNewsByCategory(apiKey, category);
            return ResponseEntity.status(HttpStatus.OK).body(newsResponse);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }

}

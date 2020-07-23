package com.Restful.NewsAPI.Controller;

import com.Restful.NewsAPI.Model.NewsResponse;
import com.Restful.NewsAPI.Service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    @GetMapping("/top-headlines/source")
    public ResponseEntity<NewsResponse> getNewsBySource(@PathVariable String apiKey, @PathVariable String source) {
        if (apiKey.isEmpty() || apiKey == null || source.isEmpty() || source == null) { //TODO: create a utility function for this ?? or use StringUtils instead
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        try {
            NewsResponse newsResponse = newsService.getNewsBySource(apiKey, source);
            return ResponseEntity.status(HttpStatus.OK).body(newsResponse);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }

    @GetMapping("/top-headlines/country")
    public ResponseEntity<NewsResponse> getNewsByCountry(@PathVariable String apiKey, @PathVariable String country) {
        if (apiKey.isEmpty() || apiKey == null || country.isEmpty() || country == null) { //TODO: create a utility function for this
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        try {
            NewsResponse newsResponse = newsService.getNewsBySource(apiKey, country);
            return ResponseEntity.status(HttpStatus.OK).body(newsResponse);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }

    @GetMapping("/top-headlines/category")
    public ResponseEntity<NewsResponse> getNewsByCategory(@PathVariable String apiKey, @PathVariable String category) {
        if (apiKey.isEmpty() || apiKey == null || category.isEmpty() || category == null) { //TODO: create a utility function for this
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        try {
            NewsResponse newsResponse = newsService.getNewsBySource(apiKey, category);
            return ResponseEntity.status(HttpStatus.OK).body(newsResponse);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }

}

package com.Restful.NewsAPI.Service;

import com.Restful.NewsAPI.Model.Article;
import com.Restful.NewsAPI.Model.NewsResponse;
import com.Restful.NewsAPI.Model.Source;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.web.client.RestTemplate;

import static org.mockito.Mockito.*;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

public class NewsServiceTest {
    private final static String BASE_URL = "https://baseurl.com";
    private NewsService newsService;
    private RestTemplate mockRestTemplate;
    private NewsResponse newsResponse;

    @BeforeEach
    public void setup() {
        mockRestTemplate = mock(RestTemplate.class);
        newsService = new NewsService(mockRestTemplate, BASE_URL);

        Source source1 = new Source();
        source1.setId("techcrunch");
        source1.setName("TechCrunch");

        Source source2 = new Source();
        source2.setId("techcrunch2");
        source2.setName("TechCrunch2");

        Article article1 = new Article();
        article1.setSource(source1);
        article1.setAuthor("Sally Gillmor");
        article1.setTitle("Gillmor Family");
        article1.setDescription("The Gillmor family, 3 weeks ago");
        article1.setUrl("https://techcrunch.com");
        article1.setUrlToImage("https://techcrunchimage.com");
        article1.setPublishedAt("2020-08-01");
        article1.setContent("The Gilmor family at a fundraiser in Boston.");

        Article article2 = new Article();
        article2.setSource(source2);
        article2.setAuthor("Tim Smith");
        article2.setTitle("Smith Family");
        article2.setDescription("The Smith family, 3 weeks ago");
        article2.setUrl("https://techcrunch2.com");
        article2.setUrlToImage("https://techcrunchimage2.com");
        article2.setPublishedAt("2020-08-02");
        article2.setContent("The Smith family at a fundraiser in Boston.");

        newsResponse = new NewsResponse();
        newsResponse.setArticles(new Article[] { article1, article2 });
    }

    // Tests for getNewsBySource()
    @Test
    void WhenCalling_getNewsBySource_withoutApiKey_shouldThrow_illegalArgumentException() {
        assertThatThrownBy(() -> {
            newsService.getNewsBySource("","source");
        }).isInstanceOfAny(IllegalArgumentException.class);
        assertThatThrownBy(() -> {
            newsService.getNewsBySource(null,"source");
        }).isInstanceOfAny(IllegalArgumentException.class);
    }

    @Test
    void WhenCalling_getNewsBySource_withoutSource_shouldThrow_illegalArgumentException() {
        assertThatThrownBy(() -> {
            newsService.getNewsBySource("apiKey","");
        }).isInstanceOfAny(IllegalArgumentException.class);
        assertThatThrownBy(() -> {
            newsService.getNewsBySource("apiKey",null);
        }).isInstanceOfAny(IllegalArgumentException.class);
    }

    @Test
    void WhenCalling_getNewsBySource_withCorrectParameters_shouldSetCorrectUriParameters() {

    }

    @Test
    void WhenCalling_getNewsBySource_shouldUseCorrectUrl() {

    }

    @Test
    void WhenCalling_getNewsBySource_shouldUseCorrectHttpMethod() {

    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectSource() {

    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectAuthor() {

    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectTitle() {

    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectDescription() {

    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectUrl() {

    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectUrlToImage() {

    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectPublishedAt() {

    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectContent() {

    }

   // TODO: add tests for category and country!
    // TODO: D.O?
}

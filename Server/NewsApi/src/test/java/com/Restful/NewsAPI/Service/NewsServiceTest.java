package com.Restful.NewsAPI.Service;

import com.Restful.NewsAPI.Model.Article;
import com.Restful.NewsAPI.Model.NewsResponse;
import com.Restful.NewsAPI.Model.Source;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.*;

public class NewsServiceTest {
    private final static String BASE_URL = "https://baseurl.com";
    private final static String API_KEY = "apiKey";
    private RestTemplate mockRestTemplate;
    private NewsService newsService;
    private NewsResponse newsResponse;

    @BeforeEach
    public void setup() {
        mockRestTemplate = mock(RestTemplate.class);
        newsService = new NewsService(mockRestTemplate, BASE_URL, API_KEY);

        Source source = new Source();
        source.setId("techcrunch");
        source.setName("TechCrunch");

        Article article = new Article();
        article.setSource(source);
        article.setAuthor("Sally Gillmor");
        article.setTitle("Gillmor Family");
        article.setDescription("The Gillmor family, 3 weeks ago");
        article.setUrl("https://techcrunch.com");
        article.setUrlToImage("https://techcrunchimage.com");
        article.setPublishedAt("2020-08-01");
        article.setContent("The Gilmor family at a fundraiser in Boston.");

        newsResponse = new NewsResponse();
        newsResponse.setArticles(new Article[]{article});
    }

    // Tests for getNewsBySource()
    @Test
    void WhenCalling_getNewsBySource_withoutSource_shouldThrow_illegalArgumentException() {
        assertThatThrownBy(() -> {
            newsService.getNewsBySource("");
        }).isInstanceOfAny(IllegalArgumentException.class);
        assertThatThrownBy(() -> {
            newsService.getNewsBySource(null);
        }).isInstanceOfAny(IllegalArgumentException.class);
    }

    @Test
    void WhenCalling_getNewsBySource_withCorrectParameters_shouldUseCorrectUrl() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        newsService.getNewsBySource("source");
        verify(mockRestTemplate).exchange(eq("https://baseurl.com/v2/top-headlines?apiKey=apiKey&Sources=source"), any(), any(), any(Class.class));
    }

    @Test
    void WhenCalling_getNewsBySource_shouldUseCorrectHttpMethod() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        newsService.getNewsBySource("source");
        verify(mockRestTemplate).exchange(anyString(), eq(HttpMethod.GET), any(), any(Class.class));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectSource() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("source");
        assertThat(newsResponseReturned.getArticles()[0].getSource().getId().equals("techcrunch"));
        assertThat(newsResponseReturned.getArticles()[0].getSource().getName().equals("TechCrunch"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectAuthor() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("source");
        assertThat(newsResponseReturned.getArticles()[0].getAuthor().equals("Sally Gillmor"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectTitle() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("source");
        assertThat(newsResponseReturned.getArticles()[0].getTitle().equals("Gillmor Family"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectDescription() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("source");
        assertThat(newsResponseReturned.getArticles()[0].getDescription().equals("The Gillmor family, 3 weeks ago"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectUrl() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("source");
        assertThat(newsResponseReturned.getArticles()[0].getUrl().equals("https://techcrunch.com"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectUrlToImage() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("source");
        assertThat(newsResponseReturned.getArticles()[0].getUrlToImage().equals("https://techcrunchimage.com"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectPublishedAt() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("source");
        assertThat(newsResponseReturned.getArticles()[0].getPublishedAt().equals("2020-08-01"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectContent() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("source");
        assertThat(newsResponseReturned.getArticles()[0].getContent().equals("The Gilmor family at a fundraiser in Boston."));
    }

    // Tests for getNewsByCategory()
    @Test
    void WhenCalling_getNewsByCategory_withoutSource_shouldThrow_illegalArgumentException() {
        assertThatThrownBy(() -> {
            newsService.getNewsByCategory("");
        }).isInstanceOfAny(IllegalArgumentException.class);
        assertThatThrownBy(() -> {
            newsService.getNewsByCategory(null);
        }).isInstanceOfAny(IllegalArgumentException.class);
    }

    @Test
    void WhenCalling_getNewsByCategory_withCorrectParameters_shouldUseCorrectUrl() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        newsService.getNewsByCategory("category");
        verify(mockRestTemplate).exchange(eq("https://baseurl.com/v2/top-headlines?apiKey=apiKey&Category=category&Country=US&Country=CA"), any(), any(), any(Class.class));
    }

    @Test
    void WhenCalling_getNewsByCategory_shouldUseCorrectHttpMethod() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        newsService.getNewsByCategory("category");
        verify(mockRestTemplate).exchange(anyString(), eq(HttpMethod.GET), any(), any(Class.class));
    }

    @Test
    void WhenCalling_getNewsByCategory_andMethodReturnsValidResponse_shouldReturnCorrectSource() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCategory("category");
        assertThat(newsResponseReturned.getArticles()[0].getSource().getId().equals("techcrunch"));
        assertThat(newsResponseReturned.getArticles()[0].getSource().getName().equals("TechCrunch"));
    }

    @Test
    void WhenCalling_getNewsByCategory_andMethodReturnsValidResponse_shouldReturnCorrectAuthor() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCategory("category");
        assertThat(newsResponseReturned.getArticles()[0].getAuthor().equals("Sally Gillmor"));
    }

    @Test
    void WhenCalling_getNewsByCategory_andMethodReturnsValidResponse_shouldReturnCorrectTitle() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCategory("category");
        assertThat(newsResponseReturned.getArticles()[0].getTitle().equals("Gillmor Family"));
    }

    @Test
    void WhenCalling_getNewsByCategory_andMethodReturnsValidResponse_shouldReturnCorrectDescription() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCategory("category");
        assertThat(newsResponseReturned.getArticles()[0].getDescription().equals("The Gillmor family, 3 weeks ago"));
    }

    @Test
    void WhenCalling_getNewsByCategory_andMethodReturnsValidResponse_shouldReturnCorrectUrl() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCategory("category");
        assertThat(newsResponseReturned.getArticles()[0].getUrl().equals("https://techcrunch.com"));
    }

    @Test
    void WhenCalling_getNewsByCategory_andMethodReturnsValidResponse_shouldReturnCorrectUrlToImage() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCategory("category");
        assertThat(newsResponseReturned.getArticles()[0].getUrlToImage().equals("https://techcrunchimage.com"));
    }

    @Test
    void WhenCalling_getNewsByCategory_andMethodReturnsValidResponse_shouldReturnCorrectPublishedAt() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCategory("category");
        assertThat(newsResponseReturned.getArticles()[0].getPublishedAt().equals("2020-08-01"));
    }

    @Test
    void WhenCalling_getNewsByCategory_andMethodReturnsValidResponse_shouldReturnCorrectContent() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCategory("category");
        assertThat(newsResponseReturned.getArticles()[0].getContent().equals("The Gilmor family at a fundraiser in Boston."));
    }
}

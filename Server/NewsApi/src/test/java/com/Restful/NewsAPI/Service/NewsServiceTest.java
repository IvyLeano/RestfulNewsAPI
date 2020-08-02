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
    private RestTemplate mockRestTemplate;
    private NewsService newsService;
    private NewsResponse newsResponse;

    @BeforeEach
    public void setup() {
        mockRestTemplate = mock(RestTemplate.class);
        newsService = new NewsService(mockRestTemplate, BASE_URL);

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
    void WhenCalling_getNewsBySource_withoutApiKey_shouldThrow_illegalArgumentException() {
        assertThatThrownBy(() -> {
            newsService.getNewsBySource("", "source");
        }).isInstanceOfAny(IllegalArgumentException.class);
        assertThatThrownBy(() -> {
            newsService.getNewsBySource(null, "source");
        }).isInstanceOfAny(IllegalArgumentException.class);
    }

    @Test
    void WhenCalling_getNewsBySource_withoutSource_shouldThrow_illegalArgumentException() {
        assertThatThrownBy(() -> {
            newsService.getNewsBySource("apiKey", "");
        }).isInstanceOfAny(IllegalArgumentException.class);
        assertThatThrownBy(() -> {
            newsService.getNewsBySource("apiKey", null);
        }).isInstanceOfAny(IllegalArgumentException.class);
    }

    @Test
    void WhenCalling_getNewsBySource_withCorrectParameters_shouldUseCorrectUrl() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        newsService.getNewsBySource("apiKey", "source");
        verify(mockRestTemplate).exchange(eq("https://baseurl.com/v2/top-headlines?apiKey=apiKey&sources=source"), any(), any(), any(Class.class));
    }

    @Test
    void WhenCalling_getNewsBySource_shouldUseCorrectHttpMethod() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        newsService.getNewsBySource("apiKey", "source");
        verify(mockRestTemplate).exchange(anyString(), eq(HttpMethod.GET), any(), any(Class.class));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectSource() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("apiKey", "source");
        assertThat(newsResponseReturned.getArticles()[0].getSource().getId().equals("techcrunch"));
        assertThat(newsResponseReturned.getArticles()[0].getSource().getName().equals("TechCrunch"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectAuthor() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("apiKey", "source");
        assertThat(newsResponseReturned.getArticles()[0].getAuthor().equals("Sally Gillmor"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectTitle() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("apiKey", "source");
        assertThat(newsResponseReturned.getArticles()[0].getTitle().equals("Gillmor Family"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectDescription() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("apiKey", "source");
        assertThat(newsResponseReturned.getArticles()[0].getDescription().equals("The Gillmor family, 3 weeks ago"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectUrl() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("apiKey", "source");
        assertThat(newsResponseReturned.getArticles()[0].getUrl().equals("https://techcrunch.com"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectUrlToImage() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("apiKey", "source");
        assertThat(newsResponseReturned.getArticles()[0].getUrlToImage().equals("https://techcrunchimage.com"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectPublishedAt() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("apiKey", "source");
        assertThat(newsResponseReturned.getArticles()[0].getPublishedAt().equals("2020-08-01"));
    }

    @Test
    void WhenCalling_getNewsBySource_andMethodReturnsValidResponse_shouldReturnCorrectContent() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsBySource("apiKey", "source");
        assertThat(newsResponseReturned.getArticles()[0].getContent().equals("The Gilmor family at a fundraiser in Boston."));
    }

    // Tests for getNewsByCountry()
    @Test
    void WhenCalling_getNewsByCountry_withoutApiKey_shouldThrow_illegalArgumentException() {
        assertThatThrownBy(() -> {
            newsService.getNewsByCountry("", "country");
        }).isInstanceOfAny(IllegalArgumentException.class);
        assertThatThrownBy(() -> {
            newsService.getNewsByCountry(null, "country");
        }).isInstanceOfAny(IllegalArgumentException.class);
    }

    @Test
    void WhenCalling_getNewsByCountry_withoutSource_shouldThrow_illegalArgumentException() {
        assertThatThrownBy(() -> {
            newsService.getNewsByCountry("apiKey", "");
        }).isInstanceOfAny(IllegalArgumentException.class);
        assertThatThrownBy(() -> {
            newsService.getNewsByCountry("apiKey", null);
        }).isInstanceOfAny(IllegalArgumentException.class);
    }

    @Test
    void WhenCalling_getNewsByCountry_withCorrectParameters_shouldUseCorrectUrl() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        newsService.getNewsByCountry("apiKey", "country");
        verify(mockRestTemplate).exchange(eq("https://baseurl.com/v2/top-headlines?apiKey=apiKey&Country=country"), any(), any(), any(Class.class));
    }

    @Test
    void WhenCalling_getNewsByCountry_shouldUseCorrectHttpMethod() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        newsService.getNewsByCountry("apiKey", "country");
        verify(mockRestTemplate).exchange(anyString(), eq(HttpMethod.GET), any(), any(Class.class));
    }

    @Test
    void WhenCalling_getNewsByCountry_andMethodReturnsValidResponse_shouldReturnCorrectSource() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCountry("apiKey", "country");
        assertThat(newsResponseReturned.getArticles()[0].getSource().getId().equals("techcrunch"));
        assertThat(newsResponseReturned.getArticles()[0].getSource().getName().equals("TechCrunch"));
    }

    @Test
    void WhenCalling_getNewsByCountry_andMethodReturnsValidResponse_shouldReturnCorrectAuthor() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCountry("apiKey", "country");
        assertThat(newsResponseReturned.getArticles()[0].getAuthor().equals("Sally Gillmor"));
    }

    @Test
    void WhenCalling_getNewsByCountry_andMethodReturnsValidResponse_shouldReturnCorrectTitle() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCountry("apiKey", "country");
        assertThat(newsResponseReturned.getArticles()[0].getTitle().equals("Gillmor Family"));
    }

    @Test
    void WhenCalling_getNewsByCountry_andMethodReturnsValidResponse_shouldReturnCorrectDescription() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCountry("apiKey", "country");
        assertThat(newsResponseReturned.getArticles()[0].getDescription().equals("The Gillmor family, 3 weeks ago"));
    }

    @Test
    void WhenCalling_getNewsByCountry_andMethodReturnsValidResponse_shouldReturnCorrectUrl() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCountry("apiKey", "country");
        assertThat(newsResponseReturned.getArticles()[0].getUrl().equals("https://techcrunch.com"));
    }

    @Test
    void WhenCalling_getNewsByCountry_andMethodReturnsValidResponse_shouldReturnCorrectUrlToImage() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCountry("apiKey", "country");
        assertThat(newsResponseReturned.getArticles()[0].getUrlToImage().equals("https://techcrunchimage.com"));
    }

    @Test
    void WhenCalling_getNewsByCountry_andMethodReturnsValidResponse_shouldReturnCorrectPublishedAt() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCountry("apiKey", "country");
        assertThat(newsResponseReturned.getArticles()[0].getPublishedAt().equals("2020-08-01"));
    }

    @Test
    void WhenCalling_getNewsByCountry_andMethodReturnsValidResponse_shouldReturnCorrectContent() {
        when(mockRestTemplate.exchange(anyString(), any(), any(), any(Class.class))).thenReturn(ResponseEntity.ok(newsResponse));
        NewsResponse newsResponseReturned = newsService.getNewsByCountry("apiKey", "country");
        assertThat(newsResponseReturned.getArticles()[0].getContent().equals("The Gilmor family at a fundraiser in Boston."));
    }


}

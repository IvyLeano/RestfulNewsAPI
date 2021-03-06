package com.Restful.NewsAPI.Controller;

import com.Restful.NewsAPI.Model.NewsResponse;
import com.Restful.NewsAPI.Service.NewsService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.HttpStatusCodeException;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

public class NewsControllerTest {

    private NewsService mockNewsService;
    private NewsController newsController;

    @BeforeEach
    public void setUp() {
        mockNewsService = mock(NewsService.class);
        newsController = new NewsController(mockNewsService);
    }

    // Tests for getNewsBySource()
    @Test
    void WhenCalling_getNewsBySource_andServiceThrows_illegalArgumentException_shouldReturn_httpStatusBadRequest() {
        doThrow(IllegalArgumentException.class).when(mockNewsService).getNewsBySource(any());
        ResponseEntity responseEntity = newsController.getNewsBySource("source");
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
    }

    @Test
    void WhenCalling_getNewsBySource_andServiceThrows_httpStatusCodeException_shouldReturn_httpStatusCodeException() {
        HttpStatusCodeException httpStatusCodeException = new HttpServerErrorException(HttpStatus.BAD_GATEWAY);
        doThrow(httpStatusCodeException).when(mockNewsService).getNewsBySource(any());
        ResponseEntity responseEntity = newsController.getNewsBySource("source");
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.BAD_GATEWAY);
    }

    @Test
    void WhenCalling_getNewsBySource_andServiceThrows_genericException_shouldReturn_genericException() {
        RuntimeException runtimeException = new RuntimeException();
        doThrow(runtimeException).when(mockNewsService).getNewsBySource(any());
        ResponseEntity responseEntity = newsController.getNewsBySource("source");
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @Test
    void WhenCalling_getNewsBySource_andServiceIsSuccessful_shouldReturn_httpStatusOk() {
        NewsResponse newsResponse = new NewsResponse();
        when(mockNewsService.getNewsBySource(any())).thenReturn(newsResponse);
        ResponseEntity responseEntity = newsController.getNewsBySource("source");
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.OK);
    }

    // Tests for getNewsByCategory()
    @Test
    void WhenCalling_getNewsByCategory_andServiceThrows_illegalArgumentException_shouldReturn_httpStatusBadRequest() {
        doThrow(IllegalArgumentException.class).when(mockNewsService).getNewsByCategory(any());
        ResponseEntity responseEntity = newsController.getNewsByCategory("category");
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
    }

    @Test
    void WhenCalling_getNewsByCategory_andServiceThrows_httpStatusCodeException_shouldReturn_httpStatusCodeException() {
        HttpStatusCodeException httpStatusCodeException = new HttpServerErrorException(HttpStatus.BAD_GATEWAY);
        doThrow(httpStatusCodeException).when(mockNewsService).getNewsByCategory(any());
        ResponseEntity responseEntity = newsController.getNewsByCategory("category");
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.BAD_GATEWAY);
    }

    @Test
    void WhenCalling_getNewsByCategory_andServiceThrows_genericException_shouldReturn_genericException() {
        RuntimeException runtimeException = new RuntimeException();
        doThrow(runtimeException).when(mockNewsService).getNewsByCategory(any());
        ResponseEntity responseEntity = newsController.getNewsByCategory("category");
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @Test
    void WhenCalling_getNewsByCategory_andServiceIsSuccessful_shouldReturn_httpStatusOk() {
        NewsResponse newsResponse = new NewsResponse();
        when(mockNewsService.getNewsByCategory(any())).thenReturn(newsResponse);
        ResponseEntity responseEntity = newsController.getNewsByCategory("category");
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.OK);
    }
}

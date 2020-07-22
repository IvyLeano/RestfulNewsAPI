package com.Restful.NewsAPI;

abstract class Utilities {
    boolean isStringEmpty(String string) {
        return string.isEmpty() || string == null || string == "";
    }
}

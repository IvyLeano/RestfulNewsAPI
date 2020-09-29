class Constants {
  // ENDPOINTS
  static const String BASE_URL = "news-api-server.herokuapp.com";
  static const String NEWS_BY_CATEGORY_ENDPOINT = "/category";
  static const String NEWS_BY_SOURCE_ENDPOINT = "/source";

  // TITLES, HEADERS AND DESCRIPTIONS
  static const String APP_BAR_TITLE = "TopNewsHeadlines";
  static const String SOURCE_HEADER = "News By Source";
  static const String CATEGORY_HEADER = "News By Category";
  static const String UNAVAILABLE_AUTHOR = "Author Unavailable";
  static const String UNAVAILABLE_DATE = "Date Unavailable";
  static const String UNAVAILABLE_DESCRIPTION = "Description Unavailable";

  // NEWS SEARCH - FILTER OPTIONS
  static const Map<String, String> sources = {
    "CNN": "CNN",
    "CBC": "CBC-NEWS",
    "NBC": "NBC-NEWS",
    "Google": "GOOGLE-NEWS",
    "The Washington Post": "THE-WASHINGTON-POST",
    "USA Today": "USA-TODAY"
  };

  static const Map<String, String> categories = {
    "Business": "business",
    "Entertainment": "entertainment",
    "Politics": "politics",
    "Science": "science",
    "Sports": "sports",
    "Technology": "technology"
  };
}

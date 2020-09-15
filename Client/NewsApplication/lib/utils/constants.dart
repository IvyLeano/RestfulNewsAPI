class Constants {
  // ENDPOINTS
  static const String BASE_URL = "76dbc3c03da7.ngrok.io";
  static const String NEWS_BY_CATEGORY_ENDPOINT = "/category";
  static const String NEWS_BY_SOURCE_ENDPOINT = "/source";

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
    "Business": "BUSINESS",
    "Entertainment": "ENTERTAINMENT",
    "Politics": "POLITICS",
    "Science": "SCIENCE",
    "Sports": "SPORTS",
    "Technology": "TECHNOLOGY"
  };

  // THEMES
}

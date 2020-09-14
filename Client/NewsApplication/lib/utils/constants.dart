class Constants {
  static const String BASE_URL =
      "f97818224b69.ngrok.io"; // TODO: update the base url, exclude "http://"
  static const String NEWS_BY_CATEGORY_ENDPOINT = "/category";
  static const String NEWS_BY_SOURCE_ENDPOINT = "/source";

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
  }; // TODO: update naming style to follow dart guidelines
}

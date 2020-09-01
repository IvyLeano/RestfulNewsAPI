enum SourceEnum {
  CNN,
  CBC,
  NBC,
  GOOGLE,
  THE_WASHINGTON_POST,
  USA_TODAY
} // TODO: update naming style to follow dart guidelines

extension SourceExtension on SourceEnum {
  String get source {
    switch (this) {
      case SourceEnum.CNN:
        return 'CNN';
      case SourceEnum.CBC:
        return 'CBC-NEWS';
      case SourceEnum.NBC:
        return 'NBC-NEWS';
      case SourceEnum.GOOGLE:
        return 'GOOGLE-NEWS';
      case SourceEnum.THE_WASHINGTON_POST:
        return 'THE-WASHINGTON-POST';
      case SourceEnum.USA_TODAY:
        return 'USA-TODAY';
      default:
        return null;
    }
  }
}
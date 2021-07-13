enum APIPath { fetch_quote }

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.fetch_quote:
        return "/qod?language=en";
      default:
        return "";
    }
  }
}

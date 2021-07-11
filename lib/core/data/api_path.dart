enum APIPath { fetch_album, fetch_todos }

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.fetch_album:
        return "/albums/1";
      case APIPath.fetch_todos:
        return "/todos";
      default:
        return "";
    }
  }
}

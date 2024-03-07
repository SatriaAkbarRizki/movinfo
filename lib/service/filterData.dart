class FilterData {
  static String filterUrlImage(String url) {
    List<String> urlParts = url.split('/');
    String urlFilter = urlParts.last;
    String urlImage = "https://image.tmdb.org/t/p/w500/$urlFilter";
    return urlImage;
  }

  static String filterReleaseDate(String date) {
    List<String> filter = date.split('00:00:00.000');
    String result = filter.join();
    return result;
  }
}

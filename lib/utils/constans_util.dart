class ConstantsUtil {
  static String server = "https://spottegal.com/public";
  static String imgUrlTmptKT = "$server/images/tempat_kt";
  static String imgUrlTmpt = "$server/images/tempat";
  static String imgUrlSpot = "$server/images/spot";
  static String imgUrlFeed = "$server/images/feed";
  static String imgUrlProfile = "$server/images/profile";

  // static String server = "http://192.168.43.130/ta/public";
  // static String imgUrlTmptKT = "$server/images/tempat_kt";
  // static String imgUrlTmpt = "$server/images/tempat";
  // static String imgUrlSpot = "$server/images/spot";
  // static String imgUrlFeed = "$server/images/feed";
  // static String imgUrlProfile = "$server/images/profile";

  // static String server = "https://apps.spottegal.com";
  // static String imgUrlTmptKT = "$server/server_api_apps/images/tempat_kt";
  // static String imgUrlTmpt = "$server/server_api_apps/images/tempat";
  // static String imgUrlSpot = "$server/server_api_apps/images/spot";
  // static String imgUrlFeed = "$server/server_api_apps/images/feed";
  // static String imgUrlProfile = "$server/server_api_apps/images/profile";

  static String getKategori() {
    return "$server/server_api_apps/api/get_tempat_kt.php";
  }

  static String getTempat() {
    return "$server/server_api_apps/api/get_tempat.php";
  }

  static String getSpot() {
    return "$server/server_api_apps/api/get_spot.php";
  }

  static String getTrending() {
    return "$server/server_api_apps/api/get_trending.php";
  }

  static String getKategoriTempat() {
    return "$server/server_api_apps/api/tempat_by_id_kt.php";
  }

  static String getTempatSpot() {
    return "$server/server_api_apps/api/spot_by_id_tempat.php";
  }

  static String cekEmail() {
    return "$server/server_api_apps/api/cekEmail.php";
  }

  static String daftar() {
    return "$server/server_api_apps/api/daftar.php";
  }

  static String getFeedByTempat(String idTempat) {
    return "$server/server_api_apps/api/get_feed_spot.php?idSpot=$idTempat";
  }

  static String uploadFeed() {
    return "$server/server_api_apps/api/post_feed.php";
  }
  static String uploadFeedEdit() {
    return "$server/server_api_apps/api/post_feed_edit.php";
  }
  static String gantiPhoto() {
    return "$server/server_api_apps/api/gantiPhoto.php";
  }

  static String viewFeed() {
    return "$server/server_api_apps/api/views_feed.php";
  }

  static String viewSpot() {
    return "$server/server_api_apps/api/views_spot.php";
  }
  static String deleteFeed() {
    return "$server/server_api_apps/api/delete_feed.php";
  }

  static String getTrendingSpot() {
    return "$server/server_api_apps/api/get_trending_spot.php";
  }

  static String getFeedUsers(String idMember) {
    return "$server/server_api_apps/api/get_feed_users.php?idUsers=$idMember";
  }
}

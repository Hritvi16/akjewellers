
import 'Environment.dart';

class APIConstant {

  static String verifyUser = Environment.url + Environment.api + "verifyphone.php";
  static String logout = Environment.url + Environment.api + "logout.php";
  static String fetchCategory = Environment.url + Environment.api + "view-category-list";
  static String fetchCategoryBanner = Environment.url + Environment.api + "api-category-banner";
  static String subCategory = Environment.url + Environment.api + "view-subcategory-list";
  static String fetchSubCategoryBanner = Environment.url + Environment.api + "api-subcategory-banner";
  static String fetchproductList = Environment.url + Environment.api + "view-product-list";
  static String fetchsingleProuct = Environment.url + Environment.api + "view-single-product";
  static String fetchBanners = Environment.url + Environment.api + "view-banner-list";
  static String fetchSliders = Environment.url + Environment.api + "view-slider-list";
  static String insertOrder = Environment.url + Environment.api + "insert-order";
  static String weSetUs = Environment.url + Environment.api + "we-set-us-api";

}

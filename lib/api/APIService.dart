import 'dart:convert';
import 'dart:io';

import 'package:akjewellers/models/ProductDetail.dart';
import 'package:akjewellers/models/Product.dart';
import 'package:akjewellers/models/SubCategory.dart';
import 'package:http/http.dart' as http;

import 'package:akjewellers/models/Category.dart';

import '../models/Banners.dart';
import '../models/Response.dart';
import '../models/Slider.dart';
import 'APIConstant.dart';

class APIService {
  Future<Category> getCategory() async {
    String url = APIConstant.fetchCategory;
    print(url);
    print(Uri.parse(url).path);
    var result = await http.get(Uri.parse(url));

    print(result.body);
    var response = jsonDecode(result.body);
    Category categoryResponse = Category.fromJson(response);
    print(result.body);
    return categoryResponse;
  }

  Future<Banners> getCategoryBanner() async {
    String url = APIConstant.fetchCategoryBanner;
    var result = await http.get(Uri.parse(url));

    print(result.body);
    var response = jsonDecode(result.body);
    Banners bannerResponse = Banners.fromJson(response);
    print(result.body);
    return bannerResponse;
  }

  Future<SubCategory> getSubCategory(Map<String, dynamic> data) async {
    String url = APIConstant.subCategory;
    var result = await http.post(Uri.parse(url), body: data);

    print(result.body);
    var response = jsonDecode(result.body);
    SubCategory subCategoryResponse = SubCategory.fromJson(response);
    print(result.body);
    return subCategoryResponse;
  }

  Future<Banners> getSubCategoryBanner() async {
    String url = APIConstant.fetchSubCategoryBanner;
    var result = await http.get(Uri.parse(url));

    print(result.body);
    var response = jsonDecode(result.body);
    Banners bannerResponse = Banners.fromJson(response);
    print(result.body);
    return bannerResponse;
  }

  Future<Product> getProduct(Map<String, dynamic> data) async {
    String url = APIConstant.fetchproductList;
    var result = await http.post(Uri.parse(url), body: data);

    print(result.body);
    var response = jsonDecode(result.body);
    Product productResponse = Product.fromJson(response);
    print(result.body);
    return productResponse;
  }

  Future<ProductDetail> getProductDetails(Map<String, dynamic> data) async {
    String url = APIConstant.fetchsingleProuct;
    var result = await http.post(Uri.parse(url), body: data);

    print(result.body);
    var response = jsonDecode(result.body);
    ProductDetail productDetailResponse = ProductDetail.fromJson(response);
    print(result.body);
    return productDetailResponse;
  }

  Future<Banners> getBanners() async {
    String url = APIConstant.fetchBanners;
    print(url);
    var result = await http.get(Uri.parse(url));

    print(result.body);
    var res = jsonDecode(result.body);
    Banners response = Banners.fromJson(res);
    print(result.body);
    return response;
  }
  Future<Product> getProducts(Map<String, dynamic> data) async {
    String url = APIConstant.fetchproductList;
    var result = await http.post(Uri.parse(url), body: data);

    print(result.body);
    var res = jsonDecode(result.body);
    Product response = Product.fromJson(res);
    print(result.body);
    return response;
  }
  Future<Slider> getSliders(Map<String, dynamic> data) async {
    String url = APIConstant.fetchSliders;
    var result = await http.post(Uri.parse(url), body: data);

    print(result.body);
    var res = jsonDecode(result.body);
    Slider response = Slider.fromJson(res);
    print(result.body);
    return response;
  }

  Future<Banners> getWeSetUs() async {
    String url = APIConstant.weSetUs;
    var result = await http.get(Uri.parse(url));

    print(result.body);
    var response = jsonDecode(result.body);
    Banners bannerResponse = Banners.fromJson(response);
    print(result.body);
    return bannerResponse;
  }

  Future<Response> insertOrder(Map<String, dynamic> data) async {
    String url = APIConstant.insertOrder;
    var result = await http.post(Uri.parse(url), body: data);

    print(result.body);
    var res = jsonDecode(result.body);
    Response response = Response.fromJson(res);
    print(result.body);
    return response;
  }
}

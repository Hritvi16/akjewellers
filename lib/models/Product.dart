/// status : true
/// data : [{"cat_name":"EARRINGS","cat_id":"33","sub_cat_id":"1","subcategory_name":"Gold Earrings","product_id":"1","name":"Jhola  Earring","product_details":"<p>Stylings :&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Casual Wear</p>\r\n\r\n<p>Finish:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; High Polish</p>","image":"05043bff45b3b06410c6052676413f86.png","image_1":"7db6d403ce1895762704dc5ebf00edc5.png","image_2":"e891bc0fbd66592de13b3ee83bcc2159.png","delivery_charge":"0","product_status":"","created_date":"2022-04-07 12:13:13"}]

class Product {
  Product({
      bool status, 
      List<ProductData> data,}){
    _status = status;
    _data = data;
}

  Product.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(ProductData.fromJson(v));
      });
    }
  }
  bool _status;
  List<ProductData> _data;
Product copyWith({  bool status,
  List<ProductData> data,
}) => Product(  status: status ?? _status,
  data: data ?? _data,
);
  bool get status => _status;
  List<ProductData> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// cat_name : "EARRINGS"
/// cat_id : "33"
/// sub_cat_id : "1"
/// subcategory_name : "Gold Earrings"
/// product_id : "1"
/// name : "Jhola  Earring"
/// product_details : "<p>Stylings :&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Casual Wear</p>\r\n\r\n<p>Finish:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; High Polish</p>"
/// image : "05043bff45b3b06410c6052676413f86.png"
/// image_1 : "7db6d403ce1895762704dc5ebf00edc5.png"
/// image_2 : "e891bc0fbd66592de13b3ee83bcc2159.png"
/// delivery_charge : "0"
/// product_status : ""
/// created_date : "2022-04-07 12:13:13"

class ProductData {
  ProductData({
      String catName, 
      String catId, 
      String subCatId, 
      String subcategoryName, 
      String productId, 
      String name, 
      String productDetails, 
      String image, 
      String image1, 
      String image2, 
      String deliveryCharge, 
      String productStatus, 
      String createdDate,}){
    _catName = catName;
    _catId = catId;
    _subCatId = subCatId;
    _subcategoryName = subcategoryName;
    _productId = productId;
    _name = name;
    _productDetails = productDetails;
    _image = image;
    _image1 = image1;
    _image2 = image2;
    _deliveryCharge = deliveryCharge;
    _productStatus = productStatus;
    _createdDate = createdDate;
}

  ProductData.fromJson(dynamic json) {
    _catName = json['cat_name'];
    _catId = json['cat_id'];
    _subCatId = json['sub_cat_id'];
    _subcategoryName = json['subcategory_name'];
    _productId = json['product_id'];
    _name = json['name'];
    _productDetails = json['product_details'];
    _image = json['image'];
    _image1 = json['image_1'];
    _image2 = json['image_2'];
    _deliveryCharge = json['delivery_charge'];
    _productStatus = json['product_status'];
    _createdDate = json['created_date'];
  }
  String _catName;
  String _catId;
  String _subCatId;
  String _subcategoryName;
  String _productId;
  String _name;
  String _productDetails;
  String _image;
  String _image1;
  String _image2;
  String _deliveryCharge;
  String _productStatus;
  String _createdDate;
ProductData copyWith({  String catName,
  String catId,
  String subCatId,
  String subcategoryName,
  String productId,
  String name,
  String productDetails,
  String image,
  String image1,
  String image2,
  String deliveryCharge,
  String productStatus,
  String createdDate,
}) => ProductData(  catName: catName ?? _catName,
  catId: catId ?? _catId,
  subCatId: subCatId ?? _subCatId,
  subcategoryName: subcategoryName ?? _subcategoryName,
  productId: productId ?? _productId,
  name: name ?? _name,
  productDetails: productDetails ?? _productDetails,
  image: image ?? _image,
  image1: image1 ?? _image1,
  image2: image2 ?? _image2,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  productStatus: productStatus ?? _productStatus,
  createdDate: createdDate ?? _createdDate,
);
  String get catName => _catName;
  String get catId => _catId;
  String get subCatId => _subCatId;
  String get subcategoryName => _subcategoryName;
  String get productId => _productId;
  String get name => _name;
  String get productDetails => _productDetails;
  String get image => _image;
  String get image1 => _image1;
  String get image2 => _image2;
  String get deliveryCharge => _deliveryCharge;
  String get productStatus => _productStatus;
  String get createdDate => _createdDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cat_name'] = _catName;
    map['cat_id'] = _catId;
    map['sub_cat_id'] = _subCatId;
    map['subcategory_name'] = _subcategoryName;
    map['product_id'] = _productId;
    map['name'] = _name;
    map['product_details'] = _productDetails;
    map['image'] = _image;
    map['image_1'] = _image1;
    map['image_2'] = _image2;
    map['delivery_charge'] = _deliveryCharge;
    map['product_status'] = _productStatus;
    map['created_date'] = _createdDate;
    return map;
  }

}
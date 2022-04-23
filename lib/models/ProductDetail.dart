/// status : true
/// data : [{"cat_name":"EARRINGS","cat_id":"33","sub_cat_id":"1","subcategory_name":"Gold Earrings","product_id":"1","name":"Jhola  Earring","product_details":"<p>Stylings :&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Casual Wear</p>\r\n\r\n<p>Finish:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; High Polish</p>","weight":"4.086","image":[{"src":"05043bff45b3b06410c6052676413f86.png"},{"src":"7db6d403ce1895762704dc5ebf00edc5.png"},{"src":"e891bc0fbd66592de13b3ee83bcc2159.png"},{"src":"f5e67bd6f7a8c5297bc7939e7cfbd0eb.png"},{"src":"2ebfaf5bd53588688a17f3e848c5bb6e.png"}],"delivery_charge":"0","product_status":"","created_date":"2022-04-07 12:13:13"}]

class ProductDetail {
  ProductDetail({
      bool status, 
      List<ProductData> data,}){
    _status = status;
    _data = data;
}

  ProductDetail.fromJson(dynamic json) {
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
ProductDetail copyWith({  bool status,
  List<ProductData> data,
}) => ProductDetail(  status: status ?? _status,
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
/// weight : "4.086"
/// image : [{"src":"05043bff45b3b06410c6052676413f86.png"},{"src":"7db6d403ce1895762704dc5ebf00edc5.png"},{"src":"e891bc0fbd66592de13b3ee83bcc2159.png"},{"src":"f5e67bd6f7a8c5297bc7939e7cfbd0eb.png"},{"src":"2ebfaf5bd53588688a17f3e848c5bb6e.png"}]
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
      String weight, 
      String carat,
      List<Images> image,
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
    _weight = weight;
    _carat = carat;
    _image = image;
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
    _weight = json['weight'];
    _carat = json['carat'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image.add(Images.fromJson(v));
      });
    }
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
  String _weight;
  String _carat;
  List<Images> _image;
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
  String weight,
  String carat,
  List<Images> image,
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
  weight: weight ?? _weight,
  carat: carat ?? _carat,
  image: image ?? _image,
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
  String get weight => _weight;
  String get carat => _carat;
  List<Images> get image => _image;
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
    map['weight'] = _weight;
    map['carat'] = _carat;
    if (_image != null) {
      map['image'] = _image.map((v) => v.toJson()).toList();
    }
    map['delivery_charge'] = _deliveryCharge;
    map['product_status'] = _productStatus;
    map['created_date'] = _createdDate;
    return map;
  }

}

/// src : "05043bff45b3b06410c6052676413f86.png"

class Images {
  Images({
      String src,}){
    _src = src;
}

  Images.fromJson(dynamic json) {
    _src = json['src'];
  }
  String _src;
Images copyWith({  String src,
}) => Images(  src: src ?? _src,
);
  String get src => _src;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['src'] = _src;
    return map;
  }

}
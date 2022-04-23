/// status : true
/// data : [{"id":"32","name":"Banner 1","image":"f27851437f0cadb3659140d919df296e.png","status":"1","created_date":"2022-04-07 08:52:42am","updated_date":"2022-04-09 04:33:43"},{"id":"33","name":"Banner 2","image":"f4c9f0294183f626ba88b28f1290c38a.png","status":"1","created_date":"2022-04-09 04:34:09am","updated_date":"2022-04-09 04:34:09"}]

class Banners {
  Banners({
      bool status, 
      List<BannerData> data,}){
    _status = status;
    _data = data;
}

  Banners.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(BannerData.fromJson(v));
      });
    }
  }
  bool _status;
  List<BannerData> _data;
Banners copyWith({  bool status,
  List<BannerData> data,
}) => Banners(  status: status ?? _status,
  data: data ?? _data,
);
  bool get status => _status;
  List<BannerData> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "32"
/// name : "Banner 1"
/// image : "f27851437f0cadb3659140d919df296e.png"
/// status : "1"
/// created_date : "2022-04-07 08:52:42am"
/// updated_date : "2022-04-09 04:33:43"

class BannerData {
  BannerData({
      String id, 
      String name, 
      String image, 
      String status, 
      String createdDate, 
      String updatedDate,}){
    _id = id;
    _name = name;
    _image = image;
    _status = status;
    _createdDate = createdDate;
    _updatedDate = updatedDate;
}

  BannerData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _status = json['status'];
    _createdDate = json['created_date'];
    _updatedDate = json['updated_date'];
  }
  String _id;
  String _name;
  String _image;
  String _status;
  String _createdDate;
  String _updatedDate;
BannerData copyWith({  String id,
  String name,
  String image,
  String status,
  String createdDate,
  String updatedDate,
}) => BannerData(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  status: status ?? _status,
  createdDate: createdDate ?? _createdDate,
  updatedDate: updatedDate ?? _updatedDate,
);
  String get id => _id;
  String get name => _name;
  String get image => _image;
  String get status => _status;
  String get createdDate => _createdDate;
  String get updatedDate => _updatedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['status'] = _status;
    map['created_date'] = _createdDate;
    map['updated_date'] = _updatedDate;
    return map;
  }

}
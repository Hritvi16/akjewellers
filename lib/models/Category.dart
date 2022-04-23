/// status : true
/// data : [{"id":"32","name":"BANGLES","image":"3b886305836a8fef08a12c5d548a37ca.png","description":"","status":"1","created_date":"2022-04-07"},{"id":"33","name":"EARRINGS","image":"aad9275030c57418ff77b1abb205d903.png","description":"","status":"1","created_date":"2022-04-09"},{"id":"34","name":"RINGS","image":"cf8f778187cd68ce859aab60d0c325c8.jpeg","description":"","status":"1","created_date":"2022-04-09"}]

class Category {
  Category({
    bool status,
    List<CatData> data,
  }) {
    _status = status;
    _data = data;
  }

  Category.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(CatData.fromJson(v));
      });
    }
  }

  bool _status;
  List<CatData> _data;

  Category copyWith({
    bool status,
    List<CatData> data,
  }) =>
      Category(
        status: status ?? _status,
        data: data ?? _data,
      );

  bool get status => _status;

  List<CatData> get data => _data;

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
/// name : "BANGLES"
/// image : "3b886305836a8fef08a12c5d548a37ca.png"
/// description : ""
/// status : "1"
/// created_date : "2022-04-07"

class CatData {
  CatData({
    String id,
    String name,
    String image,
    String description,
    String status,
    String createdDate,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _description = description;
    _status = status;
    _createdDate = createdDate;
  }

  CatData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _status = json['status'];
    _createdDate = json['created_date'];
  }

  String _id;
  String _name;
  String _image;
  String _description;
  String _status;
  String _createdDate;

  CatData copyWith({
    String id,
    String name,
    String image,
    String description,
    String status,
    String createdDate,
  }) =>
      CatData(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
        description: description ?? _description,
        status: status ?? _status,
        createdDate: createdDate ?? _createdDate,
      );

  String get id => _id;

  String get name => _name;

  String get image => _image;

  String get description => _description;

  String get status => _status;

  String get createdDate => _createdDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['status'] = _status;
    map['created_date'] = _createdDate;
    return map;
  }
}

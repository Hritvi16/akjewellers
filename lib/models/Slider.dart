/// status : true
/// data : [{"id":"2","name":"banner 2","image":"1c06ccc596525790cafea6aab24515bd.png","status":"1","created_date":"2022-04-09 04:35:03am","updated_date":"2022-04-09 04:35:03"},{"id":"3","name":"slider 3","image":"ab02d49d64f9f2c8f851edf598cd7729.png","status":"1","created_date":"2022-04-09 04:35:30am","updated_date":"2022-04-09 04:35:30"}]

class Slider {
  Slider({
      bool status, 
      List<Data> data,}){
    _status = status;
    _data = data;
}

  Slider.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }
  bool _status;
  List<Data> _data;
Slider copyWith({  bool status,
  List<Data> data,
}) => Slider(  status: status ?? _status,
  data: data ?? _data,
);
  bool get status => _status;
  List<Data> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// name : "banner 2"
/// image : "1c06ccc596525790cafea6aab24515bd.png"
/// status : "1"
/// created_date : "2022-04-09 04:35:03am"
/// updated_date : "2022-04-09 04:35:03"

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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
Data copyWith({  String id,
  String name,
  String image,
  String status,
  String createdDate,
  String updatedDate,
}) => Data(  id: id ?? _id,
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
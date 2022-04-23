/// status : true
/// data : [{"id":"32","name":"BANGLES","image":"3b886305836a8fef08a12c5d548a37ca.png","description":"","status":"1","created_date":"2022-04-07"},{"id":"33","name":"EARRINGS","image":"aad9275030c57418ff77b1abb205d903.png","description":"","status":"1","created_date":"2022-04-09"},{"id":"34","name":"RINGS","image":"cf8f778187cd68ce859aab60d0c325c8.jpeg","description":"","status":"1","created_date":"2022-04-09"}]

class SubCategory {
  SubCategory({
    bool status,
    List<SubCatData> data,
  });

  SubCategory.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(SubCatData.fromJson(v));
      });
    }
  }

  bool status;
  List<SubCatData> data;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
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

class SubCatData {
  String id;
  String name;
  String image;
  String description;
  String status;
  String createdDate;

  SubCatData({
    String id,
    String name,
    String image,
    String description,
    String status,
    String createdDate,
  });

  SubCatData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    createdDate = json['created_date'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['status'] = status;
    map['created_date'] = createdDate;
    return map;
  }
}

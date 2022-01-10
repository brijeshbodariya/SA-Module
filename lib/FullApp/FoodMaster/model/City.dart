import 'package:smartkit/FullApp/FoodMaster/helper/Constant.dart';

class City {
  int id;
  String createdAt;
  String updatedAt;
  String name;
  String alias;
  String image;
  String headerTitle;
  String headerSubtitle;
  String deletedAt;
  String logo;

  City({this.id, this.createdAt, this.updatedAt, this.name, this.alias, this.image, this.headerTitle, this.headerSubtitle, this.deletedAt, this.logo});

  /*City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    alias = json['alias'];
    image = Constant.imagepath + json['image'];
    headerTitle = json['header_title'];
    headerSubtitle = json['header_subtitle'];
    deletedAt = json['deleted_at'] ?? '';
    logo = Constant.imagepath + json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['image'] = this.image;
    data['header_title'] = this.headerTitle;
    data['header_subtitle'] = this.headerSubtitle;
    data['deleted_at'] = this.deletedAt;
    data['logo'] = this.logo;
    return data;
  }*/
}

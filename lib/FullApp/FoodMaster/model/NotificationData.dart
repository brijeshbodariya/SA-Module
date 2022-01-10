import 'dart:convert';

class NotificationData {
  String id;
  String type;
  String notifiableType;
  String notifiableId;
  Data data;
  String readAt;
  String createdAt;
  String updatedAt;

  NotificationData(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});

/*  NotificationData.fromJson(Map<String, dynamic> jsondata) {
    id = jsondata['id'];
    type = jsondata['type'];
    notifiableType = jsondata['notifiable_type'];
    notifiableId = jsondata['notifiable_id'].toString();
    data = jsondata['data'] != null
        ? new Data.fromJson(json.decode(jsondata['data']))
        : null;
    readAt = jsondata['read_at'] ?? '';
    createdAt = jsondata['created_at'];
    updatedAt = jsondata['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['notifiable_type'] = this.notifiableType;
    data['notifiable_id'] = this.notifiableId;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }*/
}

class Data {
  String title;
  String body;

  Data({this.title, this.body});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

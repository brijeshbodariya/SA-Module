import 'package:smartkit/FullApp/FoodMaster/helper/Constant.dart';

class Restaurant {
  int id;
  String createdAt;
  String updatedAt;
  String name;
  String subdomain;
  String logo;
  String cover;
  String active;
  int userId;
  String lat;
  String lng;
  String address;
  String phone;
  String minimum;
  String description;
  int fee;
  int staticFee;
  List<Radius> radius;
  int isFeatured;
  int cityId;
  int views;
  int canPickup;
  int canDeliver;
  int selfDeliver;
  int freeDeliver;
  String whatsappPhone;
  String fbUsername;
  int doCovertion;
  String currency;
  String paymentInfo;
  String molliePaymentKey;
  String alias;
  String logom;
  String icon;
  String coverm;
  bool isbookmarked;
  List<TimeSlot> timeslotlist;
  String openingTime;
  String closingTime;
  String rating;

  Restaurant({
    this.id,
    this.openingTime,
    this.closingTime,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.subdomain,
    this.logo,
    this.cover,
    this.active,
    this.userId,
    this.lat,
    this.lng,
    this.address,
    this.phone,
    this.minimum,
    this.description,
    this.fee,
    this.staticFee,
    this.radius,
    this.isFeatured,
    this.cityId,
    this.views,
    this.canPickup,
    this.canDeliver,
    this.selfDeliver,
    this.freeDeliver,
    this.whatsappPhone,
    this.fbUsername,
    this.doCovertion,
    this.currency,
    this.paymentInfo,
    this.molliePaymentKey,
    this.alias,
    this.logom,
    this.icon,
    this.coverm,
    this.isbookmarked,
    this.timeslotlist,
    this.rating,
  });
  /* Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    subdomain = json['subdomain'];
    logo = json['logo'];
    cover = json['cover'];
    active = json['active'].toString();
    userId = json['user_id'];
    lat = json['lat'] ?? '';
    lng = json['lng'] ?? '';
    address = json['address'];
    phone = json['phone'];
    minimum = json['minimum'] ?? '0';
    description = json['description'];
    fee = json['fee'];
    staticFee = json['static_fee'];
    rating = json['rating'] ?? "0.0";
    if (json['radius'] != null) {
      radius = new List<Radius>();
      json['radius'].forEach((v) {
        radius.add(new Radius.fromJson(v));
      });
    }
    isFeatured = json['is_featured'];
    cityId = json['city_id'];
    views = json['views'];
    canPickup = json['can_pickup'];
    canDeliver = json['can_deliver'];
    selfDeliver = json['self_deliver'];
    freeDeliver = json['free_deliver'];
    whatsappPhone = json['whatsapp_phone'] ?? '';
    fbUsername = json['fb_username'] ?? '';
    doCovertion = json['do_covertion'];
    currency = json['currency'];
    paymentInfo = json['payment_info'];
    molliePaymentKey = json['mollie_payment_key'];
    alias = json['alias'];
    logom = Constant.imagepath + json['logom'] ?? '';
    icon = Constant.imagepath + json['icon'] ?? '';
    coverm = Constant.imagepath + json['coverm'] ?? '';
    closingTime = '';
    openingTime = '';
    timeslotlist = new List<TimeSlot>();
  }

  Restaurant.fromHoursJson(
      Map<String, dynamic> json, List slots, String otime, String ctime) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    subdomain = json['subdomain'];
    logo = json['logo'];
    cover = json['cover'];
    active = json['active'].toString();
    userId = json['user_id'];
    lat = json['lat'] ?? '';
    lng = json['lng'] ?? '';
    address = json['address'];
    phone = json['phone'];
    minimum = json['minimum'];
    description = json['description'];
    rating = json['rating'] ?? "0.0";
    fee = json['fee'];
    staticFee = json['static_fee'];
    if (json['radius'] != null) {
      radius = new List<Radius>();
      json['radius'].forEach((v) {
        radius.add(new Radius.fromJson(v));
      });
    }
    isFeatured = json['is_featured'];
    cityId = json['city_id'];
    views = json['views'];
    canPickup = json['can_pickup'];
    canDeliver = json['can_deliver'];
    selfDeliver = json['self_deliver'];
    freeDeliver = json['free_deliver'];
    whatsappPhone = json['whatsapp_phone'] ?? '';
    fbUsername = json['fb_username'] ?? '';
    doCovertion = json['do_covertion'];
    currency = json['currency'];
    paymentInfo = json['payment_info'];
    molliePaymentKey = json['mollie_payment_key'];
    alias = json['alias'];
    logom = Constant.imagepath + json['logom'] ?? '';
    icon = Constant.imagepath + json['icon'] ?? '';
    coverm = Constant.imagepath + json['coverm'] ?? '';

    openingTime = otime ?? '';
    closingTime = ctime ?? '';
    timeslotlist = new List<TimeSlot>();
    if (slots != null) {
      slots.forEach((v) {
        timeslotlist.add(new TimeSlot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['subdomain'] = this.subdomain;
    data['logo'] = this.logo;
    data['cover'] = this.cover;
    data['active'] = this.active;
    data['user_id'] = this.userId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['minimum'] = this.minimum;
    data['description'] = this.description;
    data['fee'] = this.fee;
    data['static_fee'] = this.staticFee;
    if (this.radius != null) {
      data['radius'] = this.radius.map((v) => v.toJson()).toList();
    }
    data['is_featured'] = this.isFeatured;
    data['city_id'] = this.cityId;
    data['views'] = this.views;
    data['can_pickup'] = this.canPickup;
    data['can_deliver'] = this.canDeliver;
    data['self_deliver'] = this.selfDeliver;
    data['free_deliver'] = this.freeDeliver;
    data['whatsapp_phone'] = this.whatsappPhone;
    data['fb_username'] = this.fbUsername;
    data['do_covertion'] = this.doCovertion;
    data['currency'] = this.currency;
    data['payment_info'] = this.paymentInfo;
    data['mollie_payment_key'] = this.molliePaymentKey;
    data['alias'] = this.alias;
    data['logom'] = this.logom;
    data['icon'] = this.icon;
    data['coverm'] = this.coverm;
    return data;
  }*/
}

class Radius {
  double lat;
  double lng;

  Radius({this.lat, this.lng});

  /*Radius.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }*/
}

class TimeSlot {
  String id;
  String title;

  TimeSlot({this.id, this.title});

  /*TimeSlot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }*/
}

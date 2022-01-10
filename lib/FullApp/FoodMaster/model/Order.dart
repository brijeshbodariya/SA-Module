import 'package:smartkit/FullApp/FoodMaster/model/Restaurant.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Item.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Address.dart';

class Order {
  int id;
  String createdAt;
  String updatedAt;
  int addressId;
  int clientId;
  int restorantId;
  int driverId;
  double deliveryPrice;
  double orderPrice;
  String paymentMethod;
  String paymentStatus;
  String comment;
  String lat;
  String lng;
  String srtipePaymentId;
  int fee;
  int feeValue;
  int staticFee;
  int deliveryMethod;
  String deliveryPickupInterval;
  double vatvalue;
  int paymentProcessorFee;
  String timeToPrepare;
  String tableId;
  String phone;
  String whatsappAddress;
  String paymentLink;
  Restaurant restorant;
  List<Status> status;
  /*List<Item>*/ Item items;
  Address address;
  Driver driver;
  bool isreviewed;

  Order({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.addressId,
    this.clientId,
    this.restorantId,
    this.driverId,
    this.deliveryPrice,
    this.orderPrice,
    this.paymentMethod,
    this.paymentStatus,
    this.comment,
    this.lat,
    this.lng,
    this.srtipePaymentId,
    this.fee,
    this.feeValue,
    this.staticFee,
    this.deliveryMethod,
    this.deliveryPickupInterval,
    this.vatvalue,
    this.paymentProcessorFee,
    this.timeToPrepare,
    this.tableId,
    this.phone,
    this.whatsappAddress,
    this.paymentLink,
    this.restorant,
    this.status,
    this.items,
    this.address,
    this.driver,
    this.isreviewed,
  });

  /* Order.fromJson(Map<String, dynamic> json) {
    isreviewed = json['is_reviewed'] ?? false;
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addressId = json['address_id'];
    clientId = json['client_id'];
    restorantId = json['restorant_id'];
    driverId = json['driver_id'];
    deliveryPrice = double.parse(json['delivery_price'].toString() ?? '0');
    orderPrice = double.parse(json['order_price'].toString() ?? '0');
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    comment = json['comment'];
    lat = json['lat'] ?? '';
    lng = json['lng'] ?? '';
    srtipePaymentId = json['srtipe_payment_id'];
    fee = json['fee'];
    feeValue = json['fee_value'];
    staticFee = json['static_fee'];
    deliveryMethod = json['delivery_method'];
    deliveryPickupInterval = json['delivery_pickup_interval'];
    vatvalue = double.parse(json['vatvalue'].toString() ?? '0');
    paymentProcessorFee = json['payment_processor_fee'];
    timeToPrepare = json['time_to_prepare'].toString() ?? '';
    tableId = json['table_id'].toString() ?? '';
    phone = json['phone'].toString() ?? '';
    whatsappAddress = json['whatsapp_address'].toString() ?? '';
    paymentLink = json['payment_link'] ?? '';
   */ /* restorant = json['restorant'] != null
        ? new Restaurant.fromJson(json['restorant'])
        : null;*/ /*
    if (json['status'] != null) {
      status = new List<Status>();
      json['status'].forEach((v) {
        status.add(new Status.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = new List<Item>();
      json['items'].forEach((v) {
      //  items.add(new Item.fromOrderJson(v));
      });
    }
    address =
        json['address'] != null ? new Address.fromMap(json['address']) : null;
    driver =
        json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['address_id'] = this.addressId;
    data['client_id'] = this.clientId;
    data['restorant_id'] = this.restorantId;
    data['driver_id'] = this.driverId;
    data['delivery_price'] = this.deliveryPrice;
    data['order_price'] = this.orderPrice;
    data['payment_method'] = this.paymentMethod;
    data['payment_status'] = this.paymentStatus;
    data['comment'] = this.comment;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['srtipe_payment_id'] = this.srtipePaymentId;
    data['fee'] = this.fee;
    data['fee_value'] = this.feeValue;
    data['static_fee'] = this.staticFee;
    data['delivery_method'] = this.deliveryMethod;
    data['delivery_pickup_interval'] = this.deliveryPickupInterval;
    data['vatvalue'] = this.vatvalue;
    data['payment_processor_fee'] = this.paymentProcessorFee;
    data['time_to_prepare'] = this.timeToPrepare;
    data['table_id'] = this.tableId;
    data['phone'] = this.phone;
    data['whatsapp_address'] = this.whatsappAddress;
    data['payment_link'] = this.paymentLink;
    data['is_reviewed'] = this.isreviewed;
    if (this.restorant != null) {
   //   data['restorant'] = this.restorant.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
  //    data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address.toMap();
    }
    if (this.driver != null) {
      data['driver'] = this.driver.toJson();
    }
    return data;
  }*/
}

class Status {
  int id;
  String name;
  String alias;
  Pivot1 pivot;

  Status({this.id, this.name, this.alias, this.pivot});

  /* Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    pivot = json['pivot'] != null ? new Pivot1.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    if (this.pivot != null) {
      data['pivot1'] = this.pivot.toJson();
    }
    return data;
  }*/
}

class Pivot1 {
  int orderId;
  int statusId;
  int userId;
  String createdAt;
  String comment;

  Pivot1({this.orderId, this.statusId, this.userId, this.createdAt, this.comment});

  /* Pivot1.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    statusId = json['status_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['status_id'] = this.statusId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['comment'] = this.comment;
    return data;
  }*/
}

class Driver {
  int id;
  String googleId;
  String fbId;
  String appleId;
  String name;
  String email;
  String emailVerifiedAt;
  String phone;
  String createdAt;
  String updatedAt;
  int active;
  String stripeId;
  String cardBrand;
  String cardLastFour;
  String trialEndsAt;
  String verificationCode;
  String phoneVerifiedAt;
  String planId;
  String planStatus;
  String cancelUrl;
  String updateUrl;
  String checkoutId;
  String subscriptionPlanId;
  String stripeAccount;
  String birthDate;
  String lat;
  String lng;
  int working;
  String onorder;
  int numorders;
  int rejectedorders;
  String paypalSubscribtionId;
  String mollieCustomerId;
  String mollieMandateId;
  String taxPercentage;
  String extraBillingInformation;
  String mollieSubscribtionId;
  String paystackSubscribtionId;
  String paystackTransId;

  Driver(
      {this.id,
      this.googleId,
      this.fbId,
      this.appleId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.active,
      this.stripeId,
      this.cardBrand,
      this.cardLastFour,
      this.trialEndsAt,
      this.verificationCode,
      this.phoneVerifiedAt,
      this.planId,
      this.planStatus,
      this.cancelUrl,
      this.updateUrl,
      this.checkoutId,
      this.subscriptionPlanId,
      this.stripeAccount,
      this.birthDate,
      this.lat,
      this.lng,
      this.working,
      this.onorder,
      this.numorders,
      this.rejectedorders,
      this.paypalSubscribtionId,
      this.mollieCustomerId,
      this.mollieMandateId,
      this.taxPercentage,
      this.extraBillingInformation,
      this.mollieSubscribtionId,
      this.paystackSubscribtionId,
      this.paystackTransId});
/*
  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    googleId = json['google_id'].toString() ?? '';
    fbId = json['fb_id'].toString() ?? '';
    appleId = json['apple_id'].toString() ?? '';
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'] ?? '';
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
    stripeId = json['stripe_id'];
    cardBrand = json['card_brand'].toString() ?? '';
    cardLastFour = json['card_last_four'].toString() ?? '';
    trialEndsAt = json['trial_ends_at'].toString() ?? '';
    verificationCode = json['verification_code'].toString() ?? '';
    phoneVerifiedAt = json['phone_verified_at'].toString() ?? '';
    planId = json['plan_id'].toString() ?? '';
    planStatus = json['plan_status'];
    cancelUrl = json['cancel_url'];
    updateUrl = json['update_url'];
    checkoutId = json['checkout_id'];
    subscriptionPlanId = json['subscription_plan_id'];
    stripeAccount = json['stripe_account'];
    birthDate = json['birth_date'];
    lat = json['lat'].toString() ?? '';
    lng = json['lng'].toString() ?? '';
    working = json['working'];
    onorder = json['onorder'].toString() ?? '';
    numorders = json['numorders'];
    rejectedorders = json['rejectedorders'];
    paypalSubscribtionId = json['paypal_subscribtion_id'].toString() ?? '';
    mollieCustomerId = json['mollie_customer_id'].toString() ?? '';
    mollieMandateId = json['mollie_mandate_id'].toString() ?? '';
    taxPercentage = json['tax_percentage'];
    extraBillingInformation =
        json['extra_billing_information'].toString() ?? '';
    mollieSubscribtionId = json['mollie_subscribtion_id'].toString() ?? '';
    paystackSubscribtionId = json['paystack_subscribtion_id'].toString() ?? '';
    paystackTransId = json['paystack_trans_id'].toString() ?? '';
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['google_id'] = this.googleId;
    data['fb_id'] = this.fbId;
    data['apple_id'] = this.appleId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active'] = this.active;
    data['stripe_id'] = this.stripeId;
    data['card_brand'] = this.cardBrand;
    data['card_last_four'] = this.cardLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['verification_code'] = this.verificationCode;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['plan_id'] = this.planId;
    data['plan_status'] = this.planStatus;
    data['cancel_url'] = this.cancelUrl;
    data['update_url'] = this.updateUrl;
    data['checkout_id'] = this.checkoutId;
    data['subscription_plan_id'] = this.subscriptionPlanId;
    data['stripe_account'] = this.stripeAccount;
    data['birth_date'] = this.birthDate;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['working'] = this.working;
    data['onorder'] = this.onorder;
    data['numorders'] = this.numorders;
    data['rejectedorders'] = this.rejectedorders;
    data['paypal_subscribtion_id'] = this.paypalSubscribtionId;
    data['mollie_customer_id'] = this.mollieCustomerId;
    data['mollie_mandate_id'] = this.mollieMandateId;
    data['tax_percentage'] = this.taxPercentage;
    data['extra_billing_information'] = this.extraBillingInformation;
    data['mollie_subscribtion_id'] = this.mollieSubscribtionId;
    data['paystack_subscribtion_id'] = this.paystackSubscribtionId;
    data['paystack_trans_id'] = this.paystackTransId;
    return data;
  }*/
}

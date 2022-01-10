import 'package:smartkit/FullApp/CryptoTech/model/Country.dart';

class Operator {
  String id;
  String operatorId;
  String name;
  bool bundle;
  bool data;
  bool pin;
  bool supportsLocalAmounts;
  String denominationType;
  String senderCurrencyCode;
  String senderCurrencySymbol;
  String destinationCurrencyCode;
  String destinationCurrencySymbol;
  String commission;
  String internationalDiscount;
  String localDiscount;
  String mostPopularAmount;
  String mostPopularLocalAmount;
  String minAmount;
  String maxAmount;
  String localMinAmount;
  String localMaxAmount;
  Country country;
  Fx fx;
  List<String> logoUrls;
  List<String> fixedAmounts;
  String fixedAmountsDescriptions;
  List<String> localFixedAmounts;
  List<String> localFixedAmountsDescriptions;

  List<String> suggestedAmounts;
  List<String> suggestedAmountsMap;
  List<String> promotions;

  Operator(
      {this.id,
      this.operatorId,
      this.name,
      this.bundle,
      this.data,
      this.pin,
      this.supportsLocalAmounts,
      this.denominationType,
      this.senderCurrencyCode,
      this.senderCurrencySymbol,
      this.destinationCurrencyCode,
      this.destinationCurrencySymbol,
      this.commission,
      this.internationalDiscount,
      this.localDiscount,
      this.mostPopularAmount,
      this.mostPopularLocalAmount,
      this.minAmount,
      this.maxAmount,
      this.localMinAmount,
      this.localMaxAmount,
      this.country,
      this.fx,
      this.logoUrls,
      this.fixedAmounts,
      this.fixedAmountsDescriptions,
      this.localFixedAmounts,
      this.localFixedAmountsDescriptions,
      this.suggestedAmounts,
      this.suggestedAmountsMap,
      this.promotions});

  Operator.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    operatorId = json['operatorId'].toString();
    name = json['name'];
    bundle = json['bundle'];
    data = json['data'];
    pin = json['pin'];
    supportsLocalAmounts = json['supportsLocalAmounts'];
    denominationType = json['denominationType'];
    senderCurrencyCode = json['senderCurrencyCode'];
    senderCurrencySymbol = json['senderCurrencySymbol'];
    destinationCurrencyCode = json['destinationCurrencyCode'];
    destinationCurrencySymbol = json['destinationCurrencySymbol'];
    commission = json['commission'].toString() ?? '0';
    internationalDiscount = json['internationalDiscount'].toString() ?? '0';
    localDiscount = json['localDiscount'].toString() ?? '0';
    mostPopularAmount = json['mostPopularAmount'].toString() ?? '0';
    mostPopularLocalAmount = json['mostPopularLocalAmount'].toString() ?? '0';
    minAmount = json['minAmount'].toString() ?? '0';
    maxAmount = json['maxAmount'].toString() ?? '0';
    localMinAmount = json['localMinAmount'].toString() ?? '0';
    localMaxAmount = json['localMaxAmount'].toString() ?? '0';
    country = json['country'] != null ? new Country.fromJson(json['country']) : null;
    fx = json['fx'] != null ? new Fx.fromJson(json['fx']) : null;

    fixedAmountsDescriptions = json['fixedAmountsDescriptions'].toString() ?? '';
    suggestedAmounts = CreateStringList(json['suggestedAmounts']);
    suggestedAmountsMap = CreateStringList(json['suggestedAmountsMap']);
    promotions = CreateStringList(json['promotions']);
    localFixedAmounts = CreateStringList(json['localFixedAmounts']);
    localFixedAmountsDescriptions = CreateStringList(json['localFixedAmountsDescriptions']);
    logoUrls = CreateStringList(json['logoUrls']);
    fixedAmounts = CreateStringList(json['fixedAmounts']);
  }

  static List<String> CreateStringList(List json) {
    if (json == null || json.isEmpty) return [];
    return json.map((code) => code.toString()).toList();
  }
}

class Fx {
  double rate;
  String currencyCode;

  Fx({this.rate, this.currencyCode});

  Fx.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['currencyCode'] = this.currencyCode;
    return data;
  }
}

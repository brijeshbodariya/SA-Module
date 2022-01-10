class Address {
  int id;
  String address;
  String createdat;
  String updatedat;
  String lat;
  String lng;
  String active;
  String userid;
  String apartment;
  String intercom;
  String floor;
  String entry;
  bool inRadius;
  bool rangeFound;
  String cost_per_km;
  String cost_total;

  Address({
    this.id,
    this.address,
    this.createdat,
    this.updatedat,
    this.lat,
    this.lng,
    this.active,
    this.userid,
    this.apartment,
    this.intercom,
    this.floor,
    this.entry,
    this.inRadius,
    this.cost_per_km,
    this.cost_total,
    this.rangeFound,
  });

  /*factory Address.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Address(
      id: map['id'],
      address: map['address'] ?? '',
      createdat: map['created_at'] ?? '',
      updatedat: map['updated_at'] ?? '',
      lat: map['lat'].toString() ?? '',
      lng: map['lng'].toString() ?? '',
      active: map['active'].toString() ?? '0',
      userid: map['user_id'].toString() ?? '',
      apartment: map['apartment'] ?? '',
      intercom: map['intercom'] ?? '',
      floor: map['floor'] ?? '',
      entry: map['entry'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'createdat': createdat,
      'updatedat': updatedat,
      'lat': lat,
      'lng': lng,
      'active': active,
      'userid': userid,
      'apartment': apartment,
      'intercom': intercom,
      'floor': floor,
      'entry': entry,
    };
  }

  factory Address.fromFeeMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Address(
      id: map['id'],
      inRadius: map['inRadius'],
      rangeFound: map['rangeFound'],
      address: map['address'] ?? '',
      cost_per_km: map['cost_per_km'].toString() ?? '0',
      cost_total: map['cost_total'].toString() ?? '0',
    );
  }*/
}

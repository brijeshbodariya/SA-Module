class Item {
  int id;
  String name;
  String description;
  String image;
  double price;
  int categoryId;
  String createdAt;
  String updatedAt;
  int available;
  int hasVariants;
  int vat;
  String deletedAt;
  String logom;
  String icon;
  String shortDescription;
  List<Variants> variants;
  String categoryName;
  List<Extras> extras;
  List<Options> options;
  int restaurantid;
  OrderPivot orderPivot;

  Item(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.available,
      this.hasVariants,
      this.vat,
      this.deletedAt,
      this.logom,
      this.icon,
      this.shortDescription,
      this.variants,
      this.categoryName,
      this.extras,
      this.options,
      this.restaurantid,
      this.orderPivot});

  /*Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'].toDouble();
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    available = json['available'];
    hasVariants = json['has_variants'];
    vat = json['vat'];
    deletedAt = json['deleted_at'] ?? '';
    logom = json['logom'];
    icon = json['icon'];
    shortDescription = json['short_description'];
    if (json['variants'] != null) {
      variants = new List<Variants>();
      json['variants'].forEach((v) {
        variants.add(new Variants.fromJson(v));
      });
    }
    categoryName = json['category_name'];
    if (json['extras'] != null) {
      extras = new List<Extras>();
      json['extras'].forEach((v) {
        extras.add(new Extras.fromJson(v));
      });
    }
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
  }

  Item.fromOrderJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'].toDouble();
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    available = json['available'];
    hasVariants = json['has_variants'];
    vat = json['vat'];
    deletedAt = json['deleted_at'] ?? '';
    logom = json['logom'];
    icon = json['icon'];
    shortDescription = json['short_description'];
    if (json['pivot'] != null) {
      orderPivot = OrderPivot.fromJson(json["pivot"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['available'] = this.available;
    data['has_variants'] = this.hasVariants;
    data['vat'] = this.vat;
    data['deleted_at'] = this.deletedAt;
    data['logom'] = this.logom;
    data['icon'] = this.icon;
    data['short_description'] = this.shortDescription;
    if (this.variants != null) {
      data['variants'] = this.variants.map((v) => v.toJson()).toList();
    }
    data['category_name'] = this.categoryName;
    if (this.extras != null) {
      data['extras'] = this.extras.map((v) => v.toJson()).toList();
    }
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }*/
}

class Variants {
  int id;
  double price;
  String options;
  String image;
  int qty;
  int enableQty;
  int order;
  int itemId;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  List<Extras> extras;

  Variants(
      {this.id,
      this.price,
      this.options,
      this.image,
      this.qty,
      this.enableQty,
      this.order,
      this.itemId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.extras});

 /* Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'].toDouble();
    options = json['options'];
    image = json['image'];
    qty = json['qty'];
    enableQty = json['enable_qty'];
    order = json['order'];
    itemId = json['item_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['extras'] != null) {
      extras = new List<Extras>();
      json['extras'].forEach((v) {
        extras.add(new Extras.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['options'] = this.options;
    data['image'] = this.image;
    data['qty'] = this.qty;
    data['enable_qty'] = this.enableQty;
    data['order'] = this.order;
    data['item_id'] = this.itemId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.extras != null) {
      data['extras'] = this.extras.map((v) => v.toJson()).toList();
    }
    return data;
  }*/
}

class Extras {
  int id;
  int itemId;
  String price;
  String name;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  int extraForAllVariants;
  Pivot pivot;

  Extras(
      {this.id,
      this.itemId,
      this.price,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.extraForAllVariants,
      this.pivot});

  /*Extras.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    price = json['price'].toString();
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    extraForAllVariants = json['extra_for_all_variants'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['price'] = this.price;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['extra_for_all_variants'] = this.extraForAllVariants;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }*/
}

class Pivot {
  int variantId;
  int extraId;

  Pivot({this.variantId, this.extraId});

  /*Pivot.fromJson(Map<String, dynamic> json) {
    variantId = json['variant_id'];
    extraId = json['extra_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_id'] = this.variantId;
    data['extra_id'] = this.extraId;
    return data;
  }*/
}

class Options {
  int id;
  int itemId;
  String name;
  String options;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Options(
      {this.id,
      this.itemId,
      this.name,
      this.options,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

 /* Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    name = json['name'];
    options = json['options'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['name'] = this.name;
    data['options'] = this.options;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }*/
}

class OrderPivot {
  int orderId;
  int itemId;
  int qty;
  String extras;
  int vat;
  double vatvalue;
  double variantPrice;
  String variantName;

  OrderPivot(
      {this.orderId,
      this.itemId,
      this.qty,
      this.extras,
      this.vat,
      this.vatvalue,
      this.variantPrice,
      this.variantName});

 /* OrderPivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    itemId = json['item_id'];
    qty = json['qty'];
    extras = json['extras'];
    vat = json['vat'];
    vatvalue = json['vatvalue'];
    variantPrice = json['variant_price'];
    variantName = json['variant_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['item_id'] = this.itemId;
    data['qty'] = this.qty;
    data['extras'] = this.extras;
    data['vat'] = this.vat;
    data['vatvalue'] = this.vatvalue;
    data['variant_price'] = this.variantPrice;
    data['variant_name'] = this.variantName;
    return data;
  }*/
}

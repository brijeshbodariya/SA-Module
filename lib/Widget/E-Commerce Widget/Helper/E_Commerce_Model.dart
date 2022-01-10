class E_Commerce_Model {
  String title, description, rate, price, size, color, sale_price;
  List<String> imgs;
  product_variation variation;

  E_Commerce_Model(this.title, this.description, this.imgs, this.rate,
      this.price, this.sale_price, this.variation);

  factory E_Commerce_Model.fromJson(Map<String, dynamic> json) {
    var streetsFromJson = json['images'];

    List<String> imgs = new List<String>.from(streetsFromJson);

    return new E_Commerce_Model(
        json["title"],
        json["description"],
        imgs,
        json["rating"],
        json["price"],
        json["sales_price"],
        product_variation.fromJson(json['product_variation']));



  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "images": imgs,
        "rating": rate,
        "price": price,
        "sales_price": sale_price,
        "product_variation": variation
      };
}

class product_variation {

  List<String> weight;
  List<String> size;
  List<String> color;

  product_variation(this.weight, this.size, this.color);

  factory product_variation.fromJson(Map<String, dynamic> parsedJson) {
    var weightFromJson = parsedJson['weight'];
    List<String> weight = new List<String>.from(weightFromJson);

    var sizeFromJson = parsedJson['size'];
    List<String> size = new List<String>.from(sizeFromJson);

    var colorFromJson = parsedJson['color'];
    List<String> color = new List<String>.from(colorFromJson);

    return product_variation(weight, size, color);

  }
}

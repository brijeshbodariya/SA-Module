class Review {
  int id;
  String createdAt;
  String updatedAt;
  double rating;
  String rateableType;
  int rateableId;
  int userId;
  String username;
  int orderId;
  String comment;

  Review(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.rating,
      this.rateableType,
      this.rateableId,
      this.userId,
      this.orderId,
      this.username,
      this.comment});

/*  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rating = double.parse(json['rating'].toString() ?? '0');

    rateableType = json['rateable_type'];
    rateableId = json['rateable_id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    comment = json['comment'];
    username = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rating'] = this.rating;
    data['rateable_type'] = this.rateableType;
    data['rateable_id'] = this.rateableId;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['comment'] = this.comment;
    data['username'] = this.username;
    return data;
  }*/
}

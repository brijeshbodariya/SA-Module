class BookKingDetail {
  int id;
  int categoryId;
  String title;
  String description;

  BookKingDetail({this.id, this.categoryId, this.title, this.description});
  factory BookKingDetail.fromJson(Map<String, dynamic> json) => new BookKingDetail(id: json["Id"], categoryId: json["Category_Id"], title: json["Title"], description: json["Description"]
      //Other fields items here
      );
}

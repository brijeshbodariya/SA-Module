class BookKingCategory {
  int id;
  String title;

  BookKingCategory({
    this.id,
    this.title,
  });
  factory BookKingCategory.fromJson(Map<String, dynamic> json) => new BookKingCategory(
        id: json["Id"],
        title: json["Title"],
        //Other fields items here
      );
}

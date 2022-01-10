class BookKingBookmark {
  int id;
  int vid;

  BookKingBookmark({
    this.vid,
  });

  factory BookKingBookmark.fromJson(Map<String, dynamic> json) => new BookKingBookmark(
        vid: json["v_id"],
        //Other fields items here
      );
  //
  Map<String, dynamic> toJson() => {"v_id": vid};

  Map<String, dynamic> toMap() {
    return {"v_id": vid};
  }
}

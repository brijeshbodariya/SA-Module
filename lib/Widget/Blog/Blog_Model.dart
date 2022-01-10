class Blog_Model {
  String title, description;
  List<String> imgs;


  Blog_Model(this.title, this.description, this.imgs);

  factory Blog_Model.fromJson(Map<String, dynamic> json) {
    var imgFromJson = json['images'];



    List<String> imgs = new List<String>.from(imgFromJson);

    return new Blog_Model(
        json["title"],
        json["description"],
        imgs
      );

  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "images": imgs,

  };
}



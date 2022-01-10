class User {
  int userId;
  String firstName;
  String lastName,url;

  User({this.userId, this.firstName, this.lastName,this.url});

  static List<User> getUsers() {
    return <User>[
      User(userId: 1, firstName: "Aaron", lastName: "Jackson",url: "https://cdn.business2community.com/wp-content/uploads/2014/04/profile-picture-300x300.jpg"),
      User(userId: 2, firstName: "Ben", lastName: "John",url:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjG3yURv-evWPcWu3xE07EgN9cvCkhZU4OeIgLZJjcp_4171fP"),
      User(userId: 3, firstName: "Carrie", lastName: "Brown",url:"https://bittaxer.com/wp-content/uploads/2018/03/danielle-profile-bittaxer.jpg"),
      User(userId: 4, firstName: "Deep", lastName: "Sen",url:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYVVC6dZ57-hMuH4oggWoFds63fcuvP8f_ZepJQj4KiNBgtj231g"),
      User(userId: 5, firstName: "Emily", lastName: "Jane",url:"https://www.rd.com/wp-content/uploads/2019/03/Screen-Shot-2019-03-10-at-11.09.31-PM.png"),
    ];
  }
}
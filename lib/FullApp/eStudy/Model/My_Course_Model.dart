import 'package:smartkit/FullApp/eStudy/Model/Comment_Model.dart';
import 'package:smartkit/FullApp/eStudy/Model/Image_Model.dart';

class My_Course_Model {
  String id;
  List<Image_Model> imageList;
  String CourseName;
  String CourseSpeker;
  String CoursePrice;
  String CourseDiscount;
  String CourseDescription;
  String CourseType;
  String CourseRating;
  List<Comment_Model> commentList;

  My_Course_Model({this.id, this.imageList, this.CourseName, this.CourseSpeker, this.CoursePrice, this.CourseDiscount, this.CourseDescription, this.CourseType, this.CourseRating, this.commentList});
}

List<My_Course_Model> MyCourseList = [
  My_Course_Model(
      id: "1",
      imageList: [
        Image_Model(id: "1", image: "https://smartkit.wrteam.in/smartkit/eStudy/ai.png"),
        Image_Model(id: "2", image: "https://smartkit.wrteam.in/smartkit/eStudy/ai.png"),
        Image_Model(id: "3", image: "https://smartkit.wrteam.in/smartkit/eStudy/ai.png"),
        Image_Model(id: "4", image: "https://smartkit.wrteam.in/smartkit/eStudy/ai.png"),
      ],
      CourseName: "Design with adobe illustrator cc 2021 - MasterClass",
      CourseSpeker: "Rupesh Gondaliya",
      CoursePrice: "899.00",
      CourseDiscount: "8999.00",
      CourseDescription: "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "mycourse",
      CourseRating: "4.7",
      commentList: [
        Comment_Model(
          id: "1",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "2",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "3",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "4",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  My_Course_Model(
      id: "2",
      imageList: [
        Image_Model(id: "1", image: "https://smartkit.wrteam.in/smartkit/eStudy/ps.png"),
        Image_Model(id: "2", image: "https://smartkit.wrteam.in/smartkit/eStudy/ps.png"),
        Image_Model(id: "3", image: "https://smartkit.wrteam.in/smartkit/eStudy/ps.png"),
        Image_Model(id: "4", image: "https://smartkit.wrteam.in/smartkit/eStudy/ps.png"),
      ],
      CourseName: "Learn Autodesk Maya 2021 with Experts",
      CourseSpeker: "Vimal Gondariya",
      CoursePrice: "899.00",
      CourseDiscount: "999.00",
      CourseDescription: "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "mycourse",
      CourseRating: "4.7",
      commentList: [
        Comment_Model(
          id: "5",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "6",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "7",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "8",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  My_Course_Model(
      id: "3",
      imageList: [
        Image_Model(id: "1", image: "https://smartkit.wrteam.in/smartkit/eStudy/revit.png"),
        Image_Model(id: "2", image: "https://smartkit.wrteam.in/smartkit/eStudy/revit.png"),
        Image_Model(id: "3", image: "https://smartkit.wrteam.in/smartkit/eStudy/revit.png"),
        Image_Model(id: "4", image: "https://smartkit.wrteam.in/smartkit/eStudy/revit.png"),
      ],
      CourseName: "Autodesk Revit - beginner to an intermediate level",
      CourseSpeker: "Mahenk Vyas",
      CoursePrice: "395.00",
      CourseDiscount: "999.00",
      CourseDescription: "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "mycourse",
      CourseRating: "4.7",
      commentList: [
        Comment_Model(
          id: "9",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "10",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "11",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "12",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  My_Course_Model(
      id: "4",
      imageList: [
        Image_Model(id: "1", image: "https://smartkit.wrteam.in/smartkit/eStudy/xd.png"),
        Image_Model(id: "2", image: "https://smartkit.wrteam.in/smartkit/eStudy/xd.png"),
        Image_Model(id: "3", image: "https://smartkit.wrteam.in/smartkit/eStudy/xd.png"),
        Image_Model(id: "4", image: "https://smartkit.wrteam.in/smartkit/eStudy/xd.png"),
      ],
      CourseName: "Learn Adobe XD 2021 with Experts Masterclass",
      CourseSpeker: "Vimal Gondariya",
      CoursePrice: "659.00",
      CourseDiscount: "6999.00",
      CourseDescription: "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseRating: "4.7",
      commentList: [
        Comment_Model(
          id: "13",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "14",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "15",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "16",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
];

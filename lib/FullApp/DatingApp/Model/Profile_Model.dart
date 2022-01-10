import 'package:smartkit/FullApp/DatingApp/Model/Interested_Model.dart';

class Profile_Model {
  String id;
  String name;
  String occupation;
  String about;
  String location;
  String profile;
  List<Interested_Model> interestedList;

  Profile_Model(
      {this.id,
        this.name,
        this.occupation,
        this.about,
        this.location,
        this.profile,
        this.interestedList,});
}

List<Profile_Model> profileList = [
  Profile_Model(
    id: "1",
    name: "Alex Morris",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/datingapp/profile_a.png",
    interestedList: [
      Interested_Model(
        id: "1",
        name: "Foods",
      ),
      Interested_Model(
        id: "2",
        name: "Travelling",
      ),
      Interested_Model(
        id: "3",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "2",
    name: "Blacksmith as",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/datingapp/profile_b.png",
    interestedList: [
      Interested_Model(
        id: "4",
        name: "Foods",
      ),
      Interested_Model(
        id: "5",
        name: "Travelling",
      ),
      Interested_Model(
        id: "6",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "3",
    name: "Christina Pearson",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/datingapp/profile_c.png",
    interestedList: [
      Interested_Model(
        id: "7",
        name: "Foods",
      ),
      Interested_Model(
        id: "8",
        name: "Travelling",
      ),
      Interested_Model(
        id: "9",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "4",
    name: "Carmen Myers",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/datingapp/profile_d.png",
    interestedList: [
      Interested_Model(
        id: "10",
        name: "Foods",
      ),
      Interested_Model(
        id: "11",
        name: "Travelling",
      ),
      Interested_Model(
        id: "12",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "5",
    name: "Enrique Perkins",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/datingapp/profile_e.png",
    interestedList: [
      Interested_Model(
        id: "13",
        name: "Foods",
      ),
      Interested_Model(
        id: "14",
        name: "Travelling",
      ),
      Interested_Model(
        id: "15",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "6",
    name: "Glen Ryan",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/datingapp/profile_f.png",
    interestedList: [
      Interested_Model(
        id: "16",
        name: "Foods",
      ),
      Interested_Model(
        id: "17",
        name: "Travelling",
      ),
      Interested_Model(
        id: "18",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "7",
    name: "Judy Kuhn",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/datingapp/profile_g.png",
    interestedList: [
      Interested_Model(
        id: "19",
        name: "Foods",
      ),
      Interested_Model(
        id: "20",
        name: "Travelling",
      ),
      Interested_Model(
        id: "21",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "8",
    name: "Amber Ross",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/datingapp/profile_h.png",
    interestedList: [
      Interested_Model(
        id: "22",
        name: "Foods",
      ),
      Interested_Model(
        id: "23",
        name: "Travelling",
      ),
      Interested_Model(
        id: "24",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "9",
    name: "Samuel Parker",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/datingapp/profile_i.png",
    interestedList: [
      Interested_Model(
        id: "25",
        name: "Foods",
      ),
      Interested_Model(
        id: "26",
        name: "Travelling",
      ),
      Interested_Model(
        id: "27",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "10",
    name: "Byron Kuhn",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/datingapp/profile_j.png",
    interestedList: [
      Interested_Model(
        id: "28",
        name: "Foods",
      ),
      Interested_Model(
        id: "29",
        name: "Travelling",
      ),
      Interested_Model(
        id: "30",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "11",
    name: "Jasmine Fisher",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/datingapp/profile_k.png",
    interestedList: [
      Interested_Model(
        id: "31",
        name: "Foods",
      ),
      Interested_Model(
        id: "32",
        name: "Travelling",
      ),
      Interested_Model(
        id: "33",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "12",
    name: "Diane Wilson",
    occupation: "UX/UI Designer",
    about: "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/datingapp/profile_l.png",
    interestedList: [
      Interested_Model(
        id: "34",
        name: "Foods",
      ),
      Interested_Model(
        id: "35",
        name: "Travelling",
      ),
      Interested_Model(
        id: "36",
        name: "Designing",
      ),
    ],
  ),

];












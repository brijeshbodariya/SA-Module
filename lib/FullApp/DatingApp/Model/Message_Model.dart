
class Message_Model {
  String id;
  String name;
  String subTitle;
  String time;
  String profile;
  String counter;
  String status;

  Message_Model(
      {this.id,
        this.name,
        this.subTitle,
        this.time,
        this.profile,
        this.counter,
        this.status,
      });
}

List<Message_Model> messageList = [
  Message_Model(
    id: "1",
    name: "Carmen Myers",
    subTitle: "Like your photo",
    time: "5:45 PM",
    profile: "assets/datingapp/profile_d.png",
    counter: "1",
    status: "on",
  ),
  Message_Model(
    id: "2",
    name: "Enrique Perkins",
    subTitle: "Like your photo",
    time: "11:12 AM",
    profile: "assets/datingapp/profile_j.png",
    counter: "3",
    status: "off",
  ),
  Message_Model(
    id: "3",
    name: "Glen Ryan",
    subTitle: "Like your photo",
    time: "Today",
    profile: "assets/datingapp/profile_b.png",
    counter: "0",
    status: "on",
  ),
  Message_Model(
    id: "4",
    name: "Christina Pearson",
    subTitle: "Like your photo",
    time: "Yesterday",
    profile: "assets/datingapp/profile_c.png",
    counter: "1",
    status: "on",
  ),
  Message_Model(
    id: "5",
    name: "Judy Kuhn",
    subTitle: "Send you request",
    time: "11:12 AM",
    profile: "assets/datingapp/profile_w.png",
    counter: "0",
    status: "not",
  ),
  Message_Model(
    id: "6",
    name: "Amber Ross",
    subTitle: "Send you request",
    time: "11:12 AM",
    profile: "assets/datingapp/profile_h.png",
    counter: "0",
    status: "not",
  ),
  Message_Model(
    id: "7",
    name: "Samuel Parker",
    subTitle: "Send you request",
    time: "11:12 AM",
    profile: "assets/datingapp/profile_v.png",
    counter: "0",
    status: "not",
  ),
  Message_Model(
    id: "8",
    name: "Byron Kuhn",
    subTitle: "Send you request",
    time: "11:12 AM",
    profile: "assets/datingapp/profile_y.png",
    counter: "0",
    status: "not",
  ),
];













class NotificationView_Model {
  String id;
  String name;
  String subTitle;
  String time;
  String profile;

  NotificationView_Model(
      {this.id,
        this.name,
        this.subTitle,
        this.time,
        this.profile});
}

List<NotificationView_Model> notificationViewList = [
  NotificationView_Model(
    id: "1",
    name: "Carmen Myers",
    subTitle: "Like your photo",
    time: "5:45 PM",
    profile: "assets/datingapp/profile_d.png",
  ),
  NotificationView_Model(
    id: "2",
    name: "Enrique Perkins",
    subTitle: "Like your photo",
    time: "11:12 AM",
    profile: "assets/datingapp/profile_j.png",
  ),
  NotificationView_Model(
    id: "3",
    name: "Glen Ryan",
    subTitle: "Like your photo",
    time: "Today",
    profile: "assets/datingapp/profile_b.png",
  ),
  NotificationView_Model(
    id: "4",
    name: "Christina Pearson",
    subTitle: "Like your photo",
    time: "Yesterday",
    profile: "assets/datingapp/profile_c.png",
  ),
];












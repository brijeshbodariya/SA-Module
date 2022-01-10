class Task_Model {
  String id;
  String image;
  String taskName;
  String lessonsName;
  String lessonsDate;
  String taskStatus;

  Task_Model({this.id, this.image, this.taskName, this.lessonsName, this.lessonsDate, this.taskStatus});
}

List<Task_Model> TaskList = [
  Task_Model(
    id: "1",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/tesk_doc.png",
    taskName: "Homework - 07",
    lessonsName: "Economics",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Pending",
  ),
  Task_Model(
    id: "2",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/tesk_doc.png",
    taskName: "Homework - 06",
    lessonsName: "Business Studies",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Pending",
  ),
  Task_Model(
    id: "3",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/tesk_txt.png",
    taskName: "Homework - 05",
    lessonsName: "Accountancy",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
  Task_Model(
    id: "4",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/tesk_doc.png",
    taskName: "Homework - 04",
    lessonsName: "Economics - 1",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
  Task_Model(
    id: "5",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/tesk_pdf.png",
    taskName: "Homework - 03",
    lessonsName: "Mathematicas",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
  Task_Model(
    id: "6",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/tesk_pdf.png",
    taskName: "Homework - 02",
    lessonsName: "English",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
  Task_Model(
    id: "7",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/tesk_pdf.png",
    taskName: "Homework - 07",
    lessonsName: "Chemistry",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
];

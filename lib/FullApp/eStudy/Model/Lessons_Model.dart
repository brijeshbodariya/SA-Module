import 'package:smartkit/FullApp/eStudy/Model/LessonsContains_Model.dart';

class Lessons_Model {
  String id;
  String image;
  String lessonsName;
  String lessonsDate;
  String lessonsTime;
  String lessonsNumber;
  bool select;
  List<LessonsContains_Model> LessonsContaint;

  Lessons_Model({this.id, this.image, this.lessonsName, this.lessonsDate, this.lessonsTime, this.lessonsNumber, this.LessonsContaint});
}

List<Lessons_Model> LessonsList = [
  Lessons_Model(
    id: "1",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/les_eco.png",
    lessonsName: "Economics - 2",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "5 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "1",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "2",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "3",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "4",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "5",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "6",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "7",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "2",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/les_business.png",
    lessonsName: "Business Studies",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "10 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "8",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "9",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "10",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "11",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "12",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "13",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "14",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "3",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/les_acco.png",
    lessonsName: "Accountancy",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "2 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "15",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "16",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "17",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "18",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "19",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "20",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "21",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "4",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/les_eco2.png",
    lessonsName: "Economics - 1",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "6 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "22",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "23",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "24",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "25",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "26",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "27",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "28",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "5",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/les_math.png",
    lessonsName: "Mathematicas",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "10 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "29",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "30",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "31",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "32",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "33",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "34",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "35",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "6",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/les_english.png",
    lessonsName: "English",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "2 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "36",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "37",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "38",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "39",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "40",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "41",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "42",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "7",
    image: "https://smartkit.wrteam.in/smartkit/eStudy/les_chemi.png",
    lessonsName: "Chemistry",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "6 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "43",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "44",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "45",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
      ),
      LessonsContains_Model(
        id: "46",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "47",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "48",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "49",
        image: "https://smartkit.wrteam.in/smartkit/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
];

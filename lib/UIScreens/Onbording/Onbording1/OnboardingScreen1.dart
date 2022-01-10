import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WrOnboardingScreen1 extends StatefulWidget {
  @override
  _WrOnboardingScreen1State createState() => _WrOnboardingScreen1State();
}

class _WrOnboardingScreen1State extends State<WrOnboardingScreen1> {
  var bg = Color(0xff6974DE);
  var bodycolor = Color(0xff040078).withOpacity(0.32);
  var white = Colors.white;
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List list = [
    {
      'title': 'Drop off',
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      'img': 'https://smartkit.wrteam.in/smartkit/images/image1.png',
    },
    {
      'title': 'Deliver',
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      'img': 'https://smartkit.wrteam.in/smartkit/images/image2.png',
    },
    {
      'title': 'In progress',
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      'img': 'https://smartkit.wrteam.in/smartkit/images/image3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    onboardingItem(ItemModel item) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(imageUrl: item.imageUrl),
          SizedBox(
            height: 48,
          ),
          Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: bg,
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Text(
            item.subtitle,
            style: TextStyle(
              fontSize: 16,
              color: bodycolor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 0 ? bg : bodycolor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 1 ? bg : bodycolor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? bg : bodycolor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 28,
          ),
          MaterialButton(
            onPressed: () {
              if (currentIndex != 2) {
                carouselController.nextPage();
              } else {
                Navigator.pop(context);
              }
            },
            color: bg,
            minWidth: 180,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              currentIndex == 2 ? 'Get Started' : 'Next',
              style: TextStyle(
                fontSize: 16,
                color: white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                CarouselSlider(
                  items: list.map((item) => onboardingItem(ItemModel.fromJson(item))).toList(),
                  options: CarouselOptions(
                    initialPage: currentIndex,
                    height: double.infinity,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  carouselController: carouselController,
                ),
                currentIndex == 2
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            carouselController.animateToPage(2);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                color: bodycolor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemModel {
  String imageUrl;
  String title;
  String subtitle;

  ItemModel({this.imageUrl, this.subtitle, this.title});

  ItemModel.fromJson(json) {
    imageUrl = json['img'];
    title = json['title'];
    subtitle = json['body'];
  }
}

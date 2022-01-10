import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/UIScreens/IntreactiveView/side_in_animation.dart';

import 'color/intrectcolor.dart';
import 'fade_in_animation.dart';
import 'model/shoes.dart';

class ShoesDetail extends StatefulWidget {
  final Shoes shoes;
  ShoesDetail({this.shoes});

  @override
  _ShoesDetailState createState() => _ShoesDetailState();
}

List<String> images = [
  "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg",
  "https://smartkit.wrteam.in/smartkit/images/Nikereak2.jpg",
  "https://smartkit.wrteam.in/smartkit/images/Nikereak3.jpg",
  "https://smartkit.wrteam.in/smartkit/images/Nikereak4.jpg",
];

class _ShoesDetailState extends State<ShoesDetail> {
  String _currentImage = images[0];

  final TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: 250.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: size.width,
                        height: 190.0,
                        decoration: BoxDecoration(
                          color: Color(color4),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25.0,
                      left: 8.0,
                      right: 8.0,
                      child: SideInAnimation(
                        delay: 1,
                        child: Container(
                          width: size.width,
                          height: 200.0,
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            //
                          ),
                          child: Expanded(
                            child: InteractiveViewer(
                              transformationController: _controller,
                              maxScale: 5.0,
                              child: CachedNetworkImage(
                                placeholder: (context, url) => CircularProgressIndicator(),
                                imageUrl: _currentImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              SideInAnimation(
                delay: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "RS 2999.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            BoxIcon(icon: Icons.favorite_border),
                            SizedBox(width: 12),
                            BoxIcon(icon: Icons.share),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              SideInAnimation(
                delay: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Nike",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              SideInAnimation(
                delay: 3,
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  margin: EdgeInsets.only(left: 20.0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _currentImage = images[index];
                              _controller.value = Matrix4.identity();
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(2),
                            // color: Colors.red,
                            child: CachedNetworkImage(imageUrl: images[index]),
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(height: 25.0),
              SideInAnimation(
                delay: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SideInAnimation(
                delay: 6,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FadeInAnimation(
        delay: 2,
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonBottom(title: "Add To Cart", color: color1, textColor: color9),
              ButtonBottom(title: "Buy Now", color: color4, textColor: color1),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonBottom extends StatelessWidget {
  final String title;
  final int color;
  final int textColor;
  ButtonBottom({this.title, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50.0,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(textColor),
          ),
        ),
      ),
    );
  }
}

class BoxIcon extends StatelessWidget {
  final IconData icon;
  BoxIcon({this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Icon(icon),
    );
  }
}

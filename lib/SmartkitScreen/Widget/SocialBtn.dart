import 'package:flutter/material.dart';

class SocialBtn extends StatelessWidget {
  final Color bgcolor, textColor;
  final Icon icon;
  final String text;
  final VoidCallback onTap;

  const SocialBtn({
    Key key,
    this.bgcolor,
    this.textColor,
    this.icon,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: bgcolor, borderRadius: BorderRadius.circular(10.0), boxShadow: [
          new BoxShadow(color: Colors.black26, blurRadius: 3.0, offset: Offset(1.0, 2.0)),
        ]),
        height: 56,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 10.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon,
              SizedBox(
                width: 20.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16, color: textColor),
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

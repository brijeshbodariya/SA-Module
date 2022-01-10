import 'package:flutter/material.dart';


class ChatLoading extends StatelessWidget {
  const ChatLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
         
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
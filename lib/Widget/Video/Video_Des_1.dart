import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video_Des_1 extends StatefulWidget {
  String link, title, desc;

  Video_Des_1({this.link, this.title, this.desc});

  @override
  _YoutubePlayerState createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<Video_Des_1> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();

    print("player id***${widget.link}");
    print("urltoid--/--" + YoutubePlayer.convertUrlToId(widget.link));

    var id = YoutubePlayer.convertUrlToId(widget.link);
    _controller = YoutubePlayerController(
      initialVideoId: "$id",
      // flags: const YoutubePlayerFlags(
      //   mute: false,
      //   autoPlay: false,
      //   disableDragSeek: false,
      //   loop: false,
      //   isLive: false,
      //   forceHD: false,
      //   enableCaption: true,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube Style 1",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                YoutubePlayer(
                  controller: _controller,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline6,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    widget.desc,
                    style: Theme.of(context).textTheme.subtitle2,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

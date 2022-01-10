import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video_Des_2 extends StatefulWidget {
  String link, title, desc;

  Video_Des_2({this.link, this.title, this.desc});

  @override
  _YoutubePlayerState createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<Video_Des_2> {
  TextEditingController idController = TextEditingController();
  TextEditingController seekToController = TextEditingController();
  double _volume = 1.0;

  String position = "Get Current Position";
  String status = "Get Player Status";
  String videoDuration = "Get Video Duration";

  YoutubePlayerController _controller;

  bool isMute = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        widget.link,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube Player",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            YoutubePlayer(
              controller: _controller,
            ),
            SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: (widget.title != null)
                  ? Text(
                      widget.title,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.start,
                    )
                  : Text(
                      "-",
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.start,
                    ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: (widget.desc != null)
                  ? Text(
                      widget.desc,
                      style: Theme.of(context).textTheme.caption,
                    )
                  : Text(
                      "-",
                      style: Theme.of(context).textTheme.caption,
                    ),
            ),
            //Text(widget.desc,style: Theme.of(context).textTheme.subtitle,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(isMute ? Icons.volume_off : Icons.volume_up),
                        onPressed: () {
                          setState(
                            () {
                              isMute = !isMute;
                              _controller.setVolume(isMute ? 0 : 100);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Volume",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                        child: Slider(
                          inactiveColor: Colors.transparent,
                          value: _volume,
                          min: 0.0,
                          max: 100,
                          divisions: 10,
                          label: '${(_volume).round()}',
                          onChanged: (value) {
                            setState(() {
                              _volume = value;
                            });
                            // _videoController.setVolume(_volume);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:smartkit/FullApp/Music/Constant.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusicFuntionsMobile.dart';

bool isfav = false;

class MusicnowplayingMobile extends StatefulWidget {
  MusicnowplayingMobile({Key key}) : super(key: key);

  @override
  _MusicnowplayingStateMobile createState() => _MusicnowplayingStateMobile();
}

class _MusicnowplayingStateMobile extends State<MusicnowplayingMobile> with TickerProviderStateMixin {
  AnimationController animationController;
  List curPlayList = [
    {'name': "Flute", 'description': "rajneeti-flute-24"}
  ];
  Duration songduration;
  int milisec;
  double maxslider = 0.0;
  @override
  void initState() {
    slider = 0;

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 8),
    );
    player.currentPosition.listen((event) {
      print("_player.currentPosition: $event");
    });
    player.current.listen((event) {
      // event.audio.duration.toString();
      setState(() {
        songduration = event.audio.duration;
        var slidermaxduration = (songduration.inMilliseconds / 1000).round();
        maxslider = slidermaxduration + .00;
      });
    });
    player.open(
      playlist,
      autoStart: false,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getContent());
  }

  getBackground() {
    return BoxDecoration(
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topRight,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.2, 0.7],
        colors: [
          primary.withOpacity(0.5),
          secondary,
        ],
      ),
    );
  }

  getMiddleButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: Icon(
              isfav != true ? Icons.favorite_border : Icons.favorite,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              if (isfav == false) {
                setState(() {
                  isfav = true;
                });
              } else {
                setState(() {
                  isfav = false;
                });
              }
            }),
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            if (Platform.isAndroid) {
              Share.share('I am listening to-\n'
                  '${curPlayList[curPos]['name']}\n'
                  '$appname\n'
                  'https://play.google.com/store/apps/details?id=$androidPackage&hl=en');
            } else {
              Share.share('I am listening to-\n'
                  '${curPlayList[curPos]['name']}\n'
                  '$appname\n'
                  '$iosPackage');
            }
          },
          color: Colors.white,
        ),
      ],
    );
  }

  getMediaButton() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: primary.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              width: MediaQuery.of(context).size.width - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.fast_rewind),
                    iconSize: 35,
                    onPressed: () {
                      player.previous();
                    },
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_forward),
                    iconSize: 35,
                    onPressed: () {
                      player.next();
                    },
                    color: Colors.white,
                  ),
                ],
              )),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.white12, offset: Offset(2, 2))],
                    shape: BoxShape.circle,
                    // Box decoration takes a gradient
                    gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.2, 0.5, 0.9],
                      colors: [
                        Colors.deepOrange.withOpacity(0.5),
                        primary.withOpacity(0.7),
                        primary,
                      ],
                    ),
                  ),
                  child: Padding(padding: const EdgeInsets.all(0.0), child: _playingButton())),
            ],
          )
        ],
      ),
    );
  }

  Widget _playingButton() {
    return PlayerBuilder.isPlaying(
      player: player,
      builder: (context, isPlaying) {
        return IconButton(
          onPressed: () {
            setState(() {
              isPlaying ? animationController.stop() : animationController.repeat();
            });
            player.playOrPause();
          },
          icon: isPlaying
              ? Icon(
                  Icons.pause,
                  size: 30,
                  color: Colors.white,
                )
              : Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.white,
                ),
        );
      },
    );
  }

  String _formatDuration(Duration d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;

    String format = ((minute < 10) ? "0$minute" : "$minute") + ":" + ((second < 10) ? "0$second" : "$second");
    return format;
  }

  getContent() {
    return Container(
      decoration: getBackground(),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(alignment: Alignment.centerRight, child: getMiddleButton()),
          Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: Container(
              alignment: Alignment.center,
              child: new AnimatedBuilder(
                animation: animationController,
                child: new Container(
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        'https://smartkit.wrteam.in/smartkit/music/cat1.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget _widget) {
                  return new Transform.rotate(
                    angle: animationController.value * 6.3,
                    child: _widget,
                  );
                },
              ),
            ),
          ),
          Text(
            "${curPlayList[curPos]['name']}",
            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${curPlayList[curPos]['description']}",
              style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white60),
              textAlign: TextAlign.center,
            ),
          ),
          // getMiddleButton(),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                  stream: player.currentPosition,
                  initialData: const Duration(),
                  builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
                    Duration duration = snapshot.data;

                    return Text(
                      _formatDuration(duration),
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        thumbColor: primary,
                        overlayColor: Colors.transparent,
                        thumbShape: RoundSliderThumbShape(
                          disabledThumbRadius: 0.0,
                          enabledThumbRadius: 0.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 10,
                        ),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade200,
                      ),
                      child: StreamBuilder(
                        stream: player.currentPosition,
                        initialData: const Duration(),
                        builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
                          Duration duration = snapshot.data;
                          milisec = (duration.inMilliseconds / 1000).round();
                          slider = milisec + .00;
                          return Slider(
                            min: 0.0,
                            max: maxslider,
                            value: slider ?? 0,
                            onChanged: (value) {
                              setState(() {
                                slider = value;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Text(
                  _formatDuration(songduration),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          getMediaButton(),
        ],
      ),
    );
  }
}

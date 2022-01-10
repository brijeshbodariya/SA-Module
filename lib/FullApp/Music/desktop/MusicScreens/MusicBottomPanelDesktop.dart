import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:smartkit/FullApp/Music/Constant.dart';
import 'MusicFuntionsDesktop.dart';

class BottomPanelDesktop extends StatefulWidget {
  @override
  _BottomPanelStateDesktop createState() => _BottomPanelStateDesktop();
}

class _BottomPanelStateDesktop extends State<BottomPanelDesktop> {
  Duration songduration;
  int milisec;
  double maxslider = 0.0;
  @override
  void initState() {
    super.initState();

    player.currentPosition.listen((event) {
      print("_player.currentPosition: $event");
    });
    player.current.listen((event) {
      // event.audio.duration.toString();
      setState(() {
        songduration = event.audio.duration;
        var slidermaxduration = (songduration.inMilliseconds / 1000).round();
        maxslider = slidermaxduration + .00;
        print('MAXSLIDER: $maxslider');
      });
      print('EVENT.AUDIO.DURATION: ${event.audio.duration}');
    });
    player.open(
      playlist,
      autoStart: false,
      showNotification: false,
    );
  }

  String _formatDuration(Duration d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "0$minute" : "$minute") + ":" + ((second < 10) ? "0$second" : "$second");
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return getBottomPanelLayout();
  }

  ///bottom panel layout
  Widget getBottomPanelLayout() {
    return Container(
        // Add box decoration
        decoration: getBackGradient(),
        child: getRowLayout());
  }

  getBackGradient() {
    return BoxDecoration(
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.2, 0.5, 0.9],
        colors: [
          secondary,
          primary.withOpacity(0.7),
          primary,
        ],
      ),
    );
  }

  getRowLayout() {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, right: 20, left: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: 'https://smartkit.wrteam.in/smartkit/music/cat1.jpg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          // color: Colors.white,
                        )),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "rajneeti-flute-24",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        MarqueeWidgetDesktop(
                            direction: Axis.horizontal,
                            child: Text(
                              "rajneeti-flute-24",
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 11, color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: _playingButton()),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0, left: 10.0, right: 10.0),
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
      ],
    );
  }

  Widget _playingButton() {
    return PlayerBuilder.isPlaying(
      player: player,
      builder: (context, isPlaying) {
        return FloatingActionButton(
          backgroundColor: secondary,
          mini: true,
          child: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
          onPressed: () {
            isPlaying ? player.pause() : player.play();
          },
        );
      },
    );
  }
}

///current playing song name marquee
class MarqueeWidgetDesktop extends StatefulWidget {
  final Widget _child;
  final Axis _direction;
  final Duration _animationDuration = const Duration(milliseconds: 6000), _backDuration = const Duration(milliseconds: 800), _pauseDuration = const Duration(milliseconds: 800);

  ///constructor
  MarqueeWidgetDesktop({
    Widget child,
    Axis direction,
  })  : _child = child,
        _direction = direction;

  @override
  _MarqueeWidgetStateDesktop createState() => _MarqueeWidgetStateDesktop();
}

class _MarqueeWidgetStateDesktop extends State<MarqueeWidgetDesktop> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    scroll();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget._child,
      scrollDirection: widget._direction,
      controller: _scrollController,
    );
  }

  void scroll() async {
    //while (true) {
    if (!mounted) {
      return;
    }
    await Future.delayed(widget._pauseDuration);
    await _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: widget._animationDuration, curve: Curves.easeIn);

    await Future.delayed(widget._pauseDuration);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(0.0, duration: widget._backDuration, curve: Curves.easeOut);
      }
    });
    //}
  }
}

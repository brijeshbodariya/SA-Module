import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/VideoView/overlay_handler.dart';
import 'package:provider/provider.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/LiveVideos/LiveVideoListTablet.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController videoPlayerController;

class LiveVideoDetailTablet extends StatefulWidget {
  @override
  _LiveVideoDetailStateTablet createState() => _LiveVideoDetailStateTablet();
}

class _LiveVideoDetailStateTablet extends State<LiveVideoDetailTablet> {
  double aspectRatio = 16 / 9;
  bool isshowappbar = true;
  bool showplaypausebtn = false;
  bool isfullscreen = false;

  _initVideo() {
    videoPlayerController = VideoPlayerController.network(
      selectedlivevideo.link,
    );
    videoPlayerController.setLooping(true);

    videoPlayerController
      ..initialize().then((value) {
        showplaypausebtn = true;
        setState(() {
          aspectRatio = videoPlayerController.value.aspectRatio ?? 16 / 9;
        });
        videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          _buildVideoPlayer(),
          Expanded(child: videoInfoWidget()),
          //if (!isfullscreen) Expanded(child: videoInfoWidget()),
        ]),
      ),
    );
  }

  Widget videoInfoWidget() {
    return ListView(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10), children: [
      Text(
        selectedlivevideo.title,
        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
      ),
      Text(
        selectedlivevideo.description,
        style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(color: ColorsRes.grey)),
      ),
    ]);
  }

  Widget _buildVideoPlayer() {
    /* return isfullscreen
        ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: videoPlayerController.value.size?.width ?? 0,
                height: videoPlayerController.value.size?.height ?? 0,
                child: VideoPlayer(videoPlayerController),
              ),
            ),
          )
        : */
    return Consumer<OverlayHandlerProviderTablet>(builder: (context, overlayProvider, _) {
      return Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: Colors.black,
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: VideoPlayer(
                videoPlayerController,
              ),
            ),
          ),
          if (!overlayProvider.inPipMode)
            Positioned(
              top: 8.0,
              left: 8.0,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  color: Colors.white,
                  onPressed: () {
                    Provider.of<OverlayHandlerProviderTablet>(context, listen: false).enablePip(aspectRatio);
                  }),
            ),
          if (overlayProvider.inPipMode)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Provider.of<OverlayHandlerProviderTablet>(context, listen: false).disablePip();
                },
                child: Container(),
              ),
            ),
          VideoProgressIndicator(
            videoPlayerController,
            allowScrubbing: true,
            colors: VideoProgressColors(backgroundColor: ColorsRes.grey.withOpacity(0.5), bufferedColor: ColorsRes.grey, playedColor: ColorsRes.appcolor),
          ),
          if (showplaypausebtn)
            ButtonClickAnimation(
              onTap: () {
                setState(() {
                  videoPlayerController.value.isPlaying ? videoPlayerController.pause() : videoPlayerController.play();
                });
              },
              child: CircleAvatar(
                backgroundColor: ColorsRes.white.withOpacity(0.5),
                child: Icon(
                  videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ),
          /*  if (showplaypausebtn)
                  Positioned.fill(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            if (overlayProvider.inPipMode) {
                              Provider.of<OverlayHandlerProvider>(context,
                                      listen: false)
                                  .removeOverlay(context);
                            } else {
                              setState(() {
                                isfullscreen = !isfullscreen;
                              });
                              Provider.of<OverlayHandlerProvider>(context,
                                      listen: false)
                                  .setFullScreenValue(isfullscreen);
                              if (isfullscreen) {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.landscapeRight,
                                  DeviceOrientation.landscapeLeft,
                                ]);
                              } else {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitUp,
                                  DeviceOrientation.portraitDown,
                                ]);
                              }
                              /*Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FullScreenVideo()));*/
                            }
                          },
                          child: Icon(
                            overlayProvider.inPipMode
                                ? Icons.clear
                                : Icons.fullscreen,
                            color: ColorsRes.grey,
                          ),
                        )),
                  ), */

          if (overlayProvider.inPipMode)
            Positioned.fill(
              child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Provider.of<OverlayHandlerProviderTablet>(context, listen: false).removeOverlay(context);
                    },
                    child: Icon(
                      Icons.clear,
                      color: ColorsRes.grey,
                    ),
                  )),
            ),
        ],
      );
    });
  }
}

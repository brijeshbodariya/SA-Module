import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

bool useMobileLayout;

///primary color of your app
Color primary = music2;

///secondary color of your app
Color secondary = music3;

///for rtl, ltr support change this to your value here
TextDirection direction = TextDirection.ltr;

BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(25.0),
  topRight: Radius.circular(25.0),
);

///music player variable
int curPos = 0;
// List<Model> curPlayList = List();

///current player state
enum PlayerState { stopped, playing, paused }

///music player state
AudioPlayerState audioPlayerState;

///music player instance
AudioPlayer audioPlayer;

///player state
PlayerState playerState = PlayerState.stopped;
double slider;

///get is currently playing
dynamic get isPlaying => playerState == PlayerState.playing;

///get is currently paushed
dynamic get isPaused => playerState == PlayerState.paused;

///song total duration
Duration duration;

/// song current position
Duration position;

Duration currentPosition;

///is song play from local
bool isLocal = true;

///media player mode
PlayerMode mode = PlayerMode.MEDIA_PLAYER;

///duration listner
StreamSubscription durationSubscription;

///position change listner
StreamSubscription positionSubscription;

///complete listner
StreamSubscription playerCompleteSubscription;

///player error listner
StreamSubscription playerErrorSubscription;

///player state listner
StreamSubscription playerStateSubscription;

///app name for your app
String appname = 'Music';

///package name of your app
String androidPackage = 'com.example.SA_module';

///ios bundle name
String iosPackage = 'iosPackage';

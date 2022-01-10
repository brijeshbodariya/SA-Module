import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/VideoView/videos_overlay_widget.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/VideoView/videos_title_overlay_widget.dart';
import 'package:provider/provider.dart';

import 'overlay_handler.dart';

class OverlayService {
  addVideosOverlay(BuildContext context, Widget widget) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => VideoOverlayWidget(
        onClear: () {
          Provider.of<OverlayHandlerProviderMobile>(context, listen: false).removeOverlay(context);
        },
        widget: widget,
      ),
    );

    Provider.of<OverlayHandlerProviderMobile>(context, listen: false).insertOverlay(context, overlayEntry);
  }

  addVideoTitleOverlay(BuildContext context, Widget widget) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => VideoTitleOverlayWidget(
        onClear: () {
          Provider.of<OverlayHandlerProviderMobile>(context, listen: false).removeOverlay(context);
        },
        widget: widget,
      ),
    );

    Provider.of<OverlayHandlerProviderMobile>(context, listen: false).insertOverlay(context, overlayEntry);
  }
}

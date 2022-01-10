import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'alert_style.dart';
import 'animation_transition.dart';
import 'DialogButton.dart';
import 'constants.dart';

class Alert {
  final BuildContext context;
  final AlertType type;
  final AlertStyle style;
  final Image image;
  final String title;
  final String desc;
  final Widget content;
  final List<DialogButton> buttons;

  /// [context], [title] are required.
  Alert({
    @required this.context,
    this.type,
    this.style = const AlertStyle(),
    this.image,
    @required this.title,
    this.desc,
    this.content,
    this.buttons,
  });

  /// Displays defined alert window
  void show() {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return _buildDialog();
      },
      barrierDismissible: style.isOverlayTapDismiss,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: style.overlayColor,
      transitionDuration: style.animationDuration,
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          _showAnimation(animation, secondaryAnimation, child),
    );
  }

  // Alert dialog content widget
  Widget _buildDialog() {
    return AlertDialog(
      shape: style.alertBorder ?? _defaultShape(),
      titlePadding: EdgeInsets.all(0.0),
      title: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getCloseButton(),
              Padding(
                padding: EdgeInsets.fromLTRB(20, (style.isCloseButton ? 0 : 20), 20, 0),
                child: Column(
                  children: <Widget>[
                    _getImage(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      title,
                      style: style.titleStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: desc == null ? 5 : 10,
                    ),
                    desc == null
                        ? Container()
                        : Text(
                            desc,
                            style: style.descStyle,
                            textAlign: TextAlign.center,
                          ),
                    content == null ? Container() : content,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      contentPadding: style.buttonAreaPadding,
      content: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getButtons(),
        ),
      ),
    );
  }

  // Returns alert default border style
  ShapeBorder _defaultShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: Colors.blueGrey,
      ),
    );
  }

// Returns the close button on the top right
  Widget _getCloseButton() {
    return style.isCloseButton
        ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: Container(
              alignment: FractionalOffset.topRight,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      '$kImagePath/close.png',
                      //  package: 'rflutter_alert',
                    ),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(onTap: () => Navigator.of(context, rootNavigator: true).pop('dialog')
                      //Navigator.pop(context),
                      ),
                ),
              ),
            ),
          )
        : Container();
  }

  // Returns defined buttons. Default: Cancel Button
  List<Widget> _getButtons() {
    List<Widget> expandedButtons = [];
    if (buttons != null) {
      buttons.forEach(
        (button) {
          var buttonWidget = Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: button,
          );
          if (button.width != null && buttons.length == 1) {
            expandedButtons.add(buttonWidget);
          } else {
            expandedButtons.add(Expanded(
              child: buttonWidget,
            ));
          }
        },
      );
    } else {
      expandedButtons.add(
        Expanded(
          child: DialogButton(
              child: Text(
                "CANCEL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog')
              //  Navigator.of(context).pop()
              //Navigator.pop(context),
              ),
        ),
      );
    }

    return expandedButtons;
  }

// Returns alert image for icon
  Widget _getImage() {
    Widget response = image ?? Container();
    switch (type) {
      case AlertType.success:
        response = CachedNetworkImage(
          imageUrl: '$kImagePath/icon_success.png',
          // package: 'rflutter_alert',
        );
        break;
      case AlertType.error:
        response = CachedNetworkImage(
          imageUrl: '$kImagePath/icon_error.png',
          // package: 'rflutter_alert',
        );
        break;
      case AlertType.info:
        response = CachedNetworkImage(
          imageUrl: '$kImagePath/icon_info.png',
          // package: 'rflutter_alert',
        );
        break;
      case AlertType.warning:
        response = CachedNetworkImage(
          imageUrl: '$kImagePath/icon_warning.png',
          // package: 'rflutter_alert',
        );
        break;
      case AlertType.none:
        response = Container();
        break;
    }
    return response;
  }

// Shows alert with selected animation
  _showAnimation(animation, secondaryAnimation, child) {
    if (style.animationType == AnimationType.fromRight) {
      return AnimationTransition.fromRight(animation, secondaryAnimation, child);
    } else if (style.animationType == AnimationType.fromLeft) {
      return AnimationTransition.fromLeft(animation, secondaryAnimation, child);
    } else if (style.animationType == AnimationType.fromBottom) {
      return AnimationTransition.fromBottom(animation, secondaryAnimation, child);
    } else if (style.animationType == AnimationType.grow) {
      return AnimationTransition.grow(animation, secondaryAnimation, child);
    } else if (style.animationType == AnimationType.shrink) {
      return AnimationTransition.shrink(animation, secondaryAnimation, child);
    } else {
      return AnimationTransition.fromTop(animation, secondaryAnimation, child);
    }
  }
}

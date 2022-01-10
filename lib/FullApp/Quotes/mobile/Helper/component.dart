import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Quotes/mobile/Helper/page_transformer.dart';

class ComponentRow extends StatelessWidget {
  final String quote;
  final String personName, imageUrl;
  final PageVisibility pageVisibility;

  ComponentRow(
    this.quote,
    this.personName,
    this.imageUrl,
    this.pageVisibility,
  );

  _buildTextContainer(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var categoryText = Text(
      "~" + personName,
      style: textTheme.caption.copyWith(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        fontSize: 14.0,
      ),
      textAlign: TextAlign.center,
    );

    var titleText = Flexible(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 5),
        child: SingleChildScrollView(
          child: Text(
            quote,
            style: textTheme.headline6.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ),
    ));

    return Padding(
      padding: EdgeInsets.only(
        bottom: 56.0,
        left: 32.0,
        right: 32.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          titleText,
          categoryText,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var image = imageUrl.toString().compareTo("") == 0
    //     ? new CachedNetworkImage(imageUrl:
    //         "images/loader.png",
    //         fit: BoxFit.cover,
    //         alignment: FractionalOffset(
    //           0.5 + (pageVisibility.pagePosition / 3),
    //           0.5,
    //         ),
    //       )
    //     :

    var imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            new CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              alignment: FractionalOffset(
                0.5 + (pageVisibility.pagePosition / 3),
                0.5,
              ),
            ),
            imageOverlayGradient,
            _buildTextContainer(context),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/integration/HttpGetPostRequestWithUploadingFiles/HttpGetPostRequestWithUploadingFilesDesktop.dart';
import 'package:smartkit/integration/HttpGetPostRequestWithUploadingFiles/HttpGetPostRequestWithUploadingFilesMobile.dart';
import 'package:smartkit/integration/HttpGetPostRequestWithUploadingFiles/HttpGetPostRequestWithUploadingFilesTablet.dart';

class HttpGetPostRequestWithUploadingFilesMain extends StatelessWidget {
  const HttpGetPostRequestWithUploadingFilesMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenTypeLayout(
            desktop: HttpGetPostRequestWithUploadingFilesDesktop(),
            mobile: HttpGetPostRequestWithUploadingFilesMobile(),
            tablet: HttpGetPostRequestWithUploadingFilesTablet(),
        )
    );
  }
}

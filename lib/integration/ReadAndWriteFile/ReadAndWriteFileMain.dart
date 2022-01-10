import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/integration/ReadAndWriteFile/ReadAndWriteFileDesktop.dart';
import 'package:smartkit/integration/ReadAndWriteFile/ReadAndWriteFileMobile.dart';
import 'package:smartkit/integration/ReadAndWriteFile/ReadAndWriteFileTablet.dart';


class ReadAndWriteFileMain extends StatelessWidget {
  const ReadAndWriteFileMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenTypeLayout(
            desktop: ReadAndWriteFileDesktop(filestorage: FileStorageDesktop()),
            mobile: ReadAndWriteFileMobile(filestorage: FileStorageMobile()),
            tablet: ReadAndWriteFileTablet(filestorage: FileStorageTablet()),
        )
    );
  }
}

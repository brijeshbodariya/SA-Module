// import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/SmartkitScreen/Widget/theme.dart';

import 'Constant/SmartKitColor.dart';
import 'SmartkitScreen/Screen/Intro.dart';
import 'SmartkitScreen/Screen/SmartKitHome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Admob.initialize();
  // Add a list of test ids.
  // Admob.initialize(testDeviceIds: ['YOUR DEVICE ID']);

  FirebaseApp app = await Firebase.initializeApp();
  assert(app != null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'SmartKit',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
        // accentIconTheme: IconThemeData(color: createMaterialColor(smarKitcolor1)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenTypeLayout(
        mobile: IntroSlider(),
        tablet: MyHomePage(),
        desktop: MyHomePage(),
      ),
    );
  }
}

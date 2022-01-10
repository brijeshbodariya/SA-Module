import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SpinKit",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //******************************** rotating circle ***************************
                SpinKitRotatingCircle(color: Colors.blue),
                //******************************** rotating Square ***************************
                SpinKitRotatingPlain(color: Colors.blue),
                //******************************** rotating Chaing dot ***************************
                SpinKitChasingDots(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //********************************  Pumping heart ***************************
                SpinKitPumpingHeart(color: Colors.blue),
                //******************************** pulse ***************************
                SpinKitPulse(color: Colors.blue),
                //******************************** Double bounce ***************************
                SpinKitDoubleBounce(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //******************************** wave start ***************************
                SpinKitWave(color: Colors.blue, type: SpinKitWaveType.start),
                //******************************** wave center ***************************
                SpinKitWave(color: Colors.blue, type: SpinKitWaveType.center),
                //******************************** wave end ***************************
                SpinKitWave(color: Colors.blue, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //******************************** dot bounce ***************************
                SpinKitThreeBounce(color: Colors.blue),
                //******************************** Wondering square ***************************
                SpinKitWanderingCubes(color: Colors.blue),
                //******************************** Wondering circle ***************************
                SpinKitWanderingCubes(color: Colors.blue, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //******************************** rotating circle ***************************
                SpinKitCircle(color: Colors.blue),
                //******************************** fading circle ***************************
                SpinKitFadingFour(color: Colors.blue),
                //******************************** fading rectangle ***************************
                SpinKitFadingFour(color: Colors.blue, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //******************************** fading cube ***************************
                SpinKitFadingCube(color: Colors.blue),
                //******************************** fading grid ***************************
                SpinKitCubeGrid(size: 51.0, color: Colors.blue),
                //******************************** folding cube ***************************
                SpinKitFoldingCube(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //******************************** circle ***************************
                SpinKitRing(color: Colors.blue),
                //******************************** Double curve ***************************
                SpinKitDualRing(color: Colors.blue),
                //******************************** circle ripple***************************
                SpinKitRipple(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //******************************** fading grid ***************************
                SpinKitFadingGrid(color: Colors.blue),
                //******************************** fading square ***************************
                SpinKitFadingGrid(color: Colors.blue, shape: BoxShape.rectangle),
                //******************************** fast roating  ***************************
                SpinKitHourGlass(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //******************************** spinning circle ***************************
                SpinKitSpinningCircle(color: Colors.blue),
                //******************************** spinning rectangle ***************************
                SpinKitSpinningCircle(color: Colors.blue, shape: BoxShape.rectangle),
                //******************************** spinning fadding circle ***************************
                SpinKitFadingCircle(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //******************************** filling container ***************************
                SpinKitPouringHourGlass(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}

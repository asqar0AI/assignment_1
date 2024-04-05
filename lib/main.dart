import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_villains/villain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creative Assignment',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wave app', style: TextStyle(fontFamily: "roboto", fontWeight: FontWeight.w400)),

      ),
      body: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [Colors.lightBlue, Colors.lightGreenAccent],
                [Colors.greenAccent, Colors.lightBlueAccent],
              ],
              durations: [5000, 4000],
              heightPercentages: [0.049, 0.05], // Top and bottom height
              blur: MaskFilter.blur(BlurStyle.solid, 10),
              gradientBegin: Alignment.topLeft,
              gradientEnd: Alignment.bottomRight,
            ),
            waveAmplitude: 10,
            size: Size(double.infinity, double.infinity), // Full screen
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Villain(
                  villainAnimation: VillainAnimation.fade(), // Define animation
                  child: Text(
                    'Nurym Asqar',
                    style: TextStyle(fontSize: 25.0, fontFamily: 'Cascadia Code', color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  },
                  child: Text('Next page'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlue, Colors.lightGreenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Second Screen',
          style: TextStyle(fontSize: 24.0, color: Colors.white, fontFamily: "roboto", fontWeight: FontWeight.w400),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Villain(
              villainAnimation: VillainAnimation.fade(), // Define animation
              child: Text(
                'Second page',
                style: TextStyle(fontSize: 25.0, fontFamily: 'Cascadia Code', color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlue, Colors.lightGreenAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

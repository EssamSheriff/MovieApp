import 'package:flutter/material.dart';
import 'Home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'network.dart';

class Firstscreen extends StatefulWidget {
  @override
  _FirstscreenState createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  void initState() {
    super.initState();
    getDATA();
  }

  void getDATA() async {
    Net_working n = Net_working();
    var data = await n.GetDataMovie(1);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyHomePage(
        Data: data,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 800,
          width: 500,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('images/first_poster.jpg'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 100,
          ),
        ),
      ),
    );
  }
}

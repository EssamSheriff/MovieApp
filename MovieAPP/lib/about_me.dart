import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Constants.dart';

class About_Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: KmyAppBar(context, false),
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/Essam.png'),
              ),
              Text(
                'Essam Sheriff',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              KTextDrawer('Flutter Developer'),
              SizedBox(
                height: 10,
                width: 200,
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                color: Colors.white,
                child: ListTile(
                  leading: iconForm(
                    Icons.phone,
                    Colors.pink,
                  ),
                  title: KTextDrawer('+2 0114 124 1463'),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: iconForm(
                    Icons.email,
                    Colors.pink,
                  ),
                  title: KTextDrawer('e01112464750@gmail.com'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

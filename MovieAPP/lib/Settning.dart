import 'package:flutter/material.dart';
import 'package:movies_app/main.dart';
import 'Constants.dart';
import 'about_me.dart';

class Setting_page extends StatefulWidget {
  bool b1 = false;
  bool b2 = false;
  @override
  _Setting_pageState createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KmyAppBar(context, false),
      body: Column(
        children: [
          ListTile(
            leading: KIconDrawer(Icons.person_pin),
            title: KTextDrawer("Profile Settings"),
            subtitle: Text("Essam"),
          ),
          ListTile(
            leading: KIconDrawer(Icons.language),
            title: KTextDrawer("Language Settings"),
            subtitle: Text("English"),
          ),
          ListTile(
            leading: KIconDrawer(Icons.now_wallpaper),
            title: KTextDrawer("Theme Settings"),
            subtitle: Text("Dark"),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(140))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyApp(true)));
                                },
                                child: Text(
                                  "Light",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                              height: MediaQuery.of(context).size.height / 5,
                              child: Container(
                                color: Colors.grey[800],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp(false)));
                              },
                              child: Text(
                                "Dark",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: KIconDrawer(Icons.privacy_tip_rounded),
            title: KTextDrawer("Privacy"),
            subtitle: Text("Permission Manager"),
          ),
          ListTile(
            leading: KIconDrawer(Icons.device_unknown_rounded),
            title: KTextDrawer('About me'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return About_Me();
              }));
            },
          ),
        ],
      ),
    );
  }
}

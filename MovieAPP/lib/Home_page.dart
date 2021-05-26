import 'package:flutter/material.dart';
import 'package:movies_app/Upcoming_page.dart';
import 'Constants.dart';
import 'network.dart';
import 'Settning.dart';
import 'Favorite.dart';

class MyHomePage extends StatefulWidget {
  final Data;
  @override
  _MyHomePageState createState() => _MyHomePageState();

  MyHomePage({@required this.Data});
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> title = [];
  List<bool> Adult = [];
  List<String> photo = [];
  List<String> Released_date = [];
  List<double> rate = [];
  List<String> OverView = [];
  List<String> Language = [];

  void updating(dynamic s) async {
    setState(() {
      if (s == null) {
        for (int i = 0; i < 20; i++) {
          title.add("Null");
          photo.add("ERROR");
          Released_date.add("    ");
          rate.add(0.0);
        }
        return;
      }
      for (int i = 0; i < 20; i++) {
        title.add(s['results'][i]['title']);
        photo.add(s['results'][i]['poster_path']);
        Released_date.add(s["results"][i]["release_date"]);
        OverView.add(s["results"][i]["overview"]);
        Adult.add(s["results"][i]["adult"]);
        Language.add(s["results"][i]["original_language"]);
        try {
          rate.add(s['results'][i]['vote_average']);
        } catch (e) {
          int rateINt = s['results'][i]['vote_average'];
          rate.add(rateINt.toDouble());
        }
      }
    });
  }

  void getdataFromAPI(int i) async {
    Net_working n = Net_working();
    var data = await n.GetDataMovie(i);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Upcoming(
        Data: data,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    updating(widget.Data);
    KData = widget.Data;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: KmyAppBar(context, true),
        body: KMyListView(
          Adult: Adult,
          Language: Language,
          OverView: OverView,
          rate: rate,
          Released_date: Released_date,
          title: title,
          photo: photo,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              DrawerHeader(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/app.png'),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: null,
              ),
              ListTile(
                leading: KIconDrawer(Icons.whatshot),
                title: KTextDrawer('Upcoming Soon'),
                onTap: () {
                  getdataFromAPI(2);
                },
              ),
              ListTile(
                title: KTextDrawer('Top Rated'),
                leading: KIconDrawer(Icons.star_border_outlined),
                onTap: () {
                  getdataFromAPI(3);
                },
              ),
              ListTile(
                title: KTextDrawer('Favorite'),
                leading: KIconDrawer(Icons.favorite_rounded),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Favorite_page();
                  }));
                },
              ),
              ListTile(
                leading: KIconDrawer(Icons.settings),
                title: KTextDrawer('Settings'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Setting_page();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

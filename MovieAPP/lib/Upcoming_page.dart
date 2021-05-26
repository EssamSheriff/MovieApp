import 'package:flutter/material.dart';
import 'Constants.dart';

class Upcoming extends StatefulWidget {
  final Data;
  @override
  _UpcomingState createState() => _UpcomingState();

  Upcoming({this.Data});
}

class _UpcomingState extends State<Upcoming> {
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

  @override
  void initState() {
    super.initState();
    updating(widget.Data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: KmyAppBar(context, false),
        body: KMyListView(
          Adult: Adult,
          Language: Language,
          OverView: OverView,
          rate: rate,
          Released_date: Released_date,
          title: title,
          photo: photo,
        ),
      ),
    );
  }
}

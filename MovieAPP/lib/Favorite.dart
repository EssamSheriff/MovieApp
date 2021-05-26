import 'package:flutter/material.dart';
import 'Constants.dart';

class Favorite_page extends StatefulWidget {
  @override
  _Favorite_pageState createState() => _Favorite_pageState();
}

class _Favorite_pageState extends State<Favorite_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //TODO
    //Print all items
    for (int i = 0; i < KFavoritetitle.length; i++) {
      print("**************************************************");
      print(KFavoriteAdult[i].toString());
      print(KFavoritetitle[i].toString());
      print(KFavoritephoto[i].toString());
      print(KFavoriteReleased_date[i].toString());
      print(KFavoriterate[i].toString());
      print(KFavoriteLanguage[i].toString());
      print("**************************************************");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: KmyAppBar(context, false),
        body: KMyListView(
          Adult: KFavoriteAdult,
          Language: KFavoriteLanguage,
          OverView: KFavoriteOverView,
          rate: KFavoriterate,
          Released_date: KFavoriteReleased_date,
          title: KFavoritetitle,
          photo: KFavoritephoto,
        ),
      ),
    );
  }
}

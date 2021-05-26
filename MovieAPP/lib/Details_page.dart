import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class DetailsPage extends StatefulWidget {
  final DE_photo;
  final DE_title;
  final DE_rate;
  final DE_adult;
  final DE_Released_date;
  final DE_OverView;
  final DE_Language;
  final index;

  DetailsPage({
    this.DE_photo,
    this.DE_title,
    this.DE_rate,
    this.DE_adult,
    this.DE_Released_date,
    this.DE_OverView,
    this.DE_Language,
    this.index,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Color Colour;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < KFavoritetitle.length; i++) {
      if (KFavoritetitle[i] == widget.DE_title) {
        Colour = Colors.red;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: KmyAppBar(context, false),
        body: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w1280/${widget.DE_photo}",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: KTextDetails(widget.DE_title),
                        subtitle: KTextDetails_s(widget.DE_OverView),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KTextDetails("Rate"),
                                KTextDetails_s(widget.DE_rate.toString()),
                                KTextDetails("Language"),
                                KTextDetails_s(widget.DE_Language),
                                KTextDetails("Adult ??"),
                                KTextDetails_s(widget.DE_adult ? "Yes" : "No"),
                                KTextDetails("Released Date"),
                                KTextDetails_s(widget.DE_Released_date),
                              ],
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (Colour == Colors.white) {
                                    Colour = Colors.red;
                                    AddToFavoriteList();
                                  } else {
                                    Colour = Colors.white;
                                    RemoveFromFavoriteList();
                                  }
                                });
                              },
                              child: Icon(
                                Icons.favorite_rounded,
                                size: 60,
                                color: Colour,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void AddToFavoriteList() async {
    await KFavoriteAdult.add(widget.DE_adult);
    await KFavoriteLanguage.add(widget.DE_Language);
    await KFavoriteOverView.add(widget.DE_OverView);
    await KFavoritephoto.add(widget.DE_photo);
    await KFavoriterate.add(widget.DE_rate);
    await KFavoriteReleased_date.add(widget.DE_Released_date);
    await KFavoritetitle.add(widget.DE_title);
  }

  void RemoveFromFavoriteList() async {
    print("Len" + KFavoriteLanguage.length.toString());
    print("Len" + KFavoriteLanguage.length.toString());
    print(widget.index);
    await KFavoriteAdult.removeAt(widget.index);
    await KFavoriteLanguage.removeAt(widget.index);
    await KFavoriteOverView.removeAt(widget.index);
    await KFavoritephoto.removeAt(widget.index);
    await KFavoriterate.removeAt(widget.index);
    await KFavoriteReleased_date.removeAt(widget.index);
    await KFavoritetitle.removeAt(widget.index);
    print("Len" + KFavoriteLanguage.length.toString());
    print("Len" + KFavoriteLanguage.length.toString());
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/Home_page.dart';
import 'Details_page.dart';

Widget KIconDrawer(IconData icon) {
  return Icon(
    icon,
    color: Colors.redAccent,
    size: 40,
  );
}

Widget KTextDrawer(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget KTextDetails(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget KTextDetails_s(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget iconForm(IconData icon, Color Colr) {
  return Icon(
    icon,
    color: Colr,
    size: 40,
  );
}

dynamic KData;
Widget KmyAppBar(BuildContext context, bool check) {
  return AppBar(
    backgroundColor: Colors.redAccent,
    title: Text('Filmk'),
    leadingWidth: 50,
    leading: check
        ? null
        : IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            Data: KData,
                          )));
            },
          ),
    actions: [
      Icon(
        Icons.whatshot,
        size: 40,
      ),
      SizedBox(
        width: 230,
      ),
    ],
  );
}

List<String> KFavoritetitle = [];
List<bool> KFavoriteAdult = [];
List<String> KFavoritephoto = [];
List<String> KFavoriteReleased_date = [];
List<double> KFavoriterate = [];
List<String> KFavoriteOverView = [];
List<String> KFavoriteLanguage = [];

Widget KMyListView({
  @required List<String> title,
  @required List<bool> Adult,
  @required List<String> photo,
  @required List<String> Released_date,
  @required List<double> rate,
  @required List<String> OverView,
  @required List<String> Language,
}) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        color: Colors.blueAccent,
        height: 150,
        child: GestureDetector(
          onTap: () {
            print(index);
            print("clicked");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              print(Adult[index]);
              print("clicked");
              return DetailsPage(
                index: index,
                DE_photo: photo[index],
                DE_adult: Adult[index],
                DE_Language: Language[index],
                DE_OverView: OverView[index],
                DE_rate: rate[index],
                DE_Released_date: Released_date[index],
                DE_title: title[index],
              );
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 90,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                        ),
                        Text(
                          '${rate[index].toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Released: ${Released_date[index]}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 70,
              ),
              Image(
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w1280/${photo[index]}",
                ),
              ),
            ],
          ),
        ),
      );
    },
    itemCount: title.length,
  );
}

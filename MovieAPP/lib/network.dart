import 'package:http/http.dart' as http;
import 'dart:convert';

const MyKey = "d911a0943545b7b9a7a8803c3415d8a4";
const url = "https://api.themoviedb.org/3/movie/101?api_key=$MyKey";
const WebSite = "https://api.themoviedb.org/3";
const URLDiscover =
    "$WebSite/discover/movie?api_key=$MyKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1";
const URLUpcoming =
    "$WebSite/movie/upcoming?api_key=$MyKey&language=en-US&page=1&fbclid=IwAR3oC6xHTCIVh1hCy7N6cE6J99HEPKkxj2DkJXgnAnfZ_PGhtdPOY6LYpB8";
const URLToprate =
    "$WebSite/movie/top_rated?api_key=$MyKey&language=en-US&page=1&fbclid=IwAR0dBW1V8h7V0nqcbC3Spy8SMJbnTsxNSfAknRuxMOGKqSDGUt6ir4-5ARM";

class Net_working {
  Future GetDataMovie(int select) async {
    switch (select) {
      case 1:
        http.Response response = await http.get(URLDiscover);
        if (response.statusCode == 200) {
          String Data = response.body;
          return jsonDecode(Data);
        } else {
          print(response.statusCode);
        }
        break;

      case 2:
        http.Response response = await http.get(URLUpcoming);
        if (response.statusCode == 200) {
          String Data = response.body;
          return jsonDecode(Data);
        } else {
          print(response.statusCode);
        }
        break;

      case 3:
        http.Response response = await http.get(URLToprate);
        if (response.statusCode == 200) {
          String Data = response.body;
          return jsonDecode(Data);
        } else {
          print(response.statusCode);
        }
        break;
    }
  }
}

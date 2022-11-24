import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/widget_drawer/watchlist.dart';

Future<List<MyWatchList>> fetchWatchlist() async {
  var url = Uri.parse('https://katalogluluorv.herokuapp.com/mywatchlist/json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Watchlist
  List<MyWatchList> listWatchlist = [];
  for (var d in data) {
    if (d != null) {
      listWatchlist.add(MyWatchList.fromJson(d));
    }
  }

  return listWatchlist;
}

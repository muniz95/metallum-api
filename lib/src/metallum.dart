import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:metallum/src/urls.dart';
import 'package:metallum/src/wrapper/band.dart';

getLatestBands() async {
  DateTime now = new DateTime.now();
  String url = bandList(now.year, now.month);
  http.Response res = await http.get(url);
  return parseBandList(JSON.decode(res.body));
}
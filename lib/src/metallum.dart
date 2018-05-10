import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:metallum/src/urls.dart';
import 'package:metallum/src/wrapper/band.dart';

getLatestBands(int year, int month) async {
  String url = bandList(year, month);
  http.Response res = await http.get(url);
  return parseBandList(JSON.decode(res.body));
}
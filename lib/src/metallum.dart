import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:metallum/src/urls.dart';
import 'package:metallum/src/wrapper/artist.dart';
import 'package:metallum/src/wrapper/band.dart';
import 'package:metallum/src/wrapper/label.dart';

getLatestBands(int year, int month) async {
  String url = latestBands(year, month);
  http.Response res = await http.get(url);
  return parseBandList(JSON.decode(res.body));
}

getLatestLabels(int year, int month) async {
  String url = latestLabels(year, month);
  http.Response res = await http.get(url);
  return parseLatestLabelsList(JSON.decode(res.body));
}

getLatestArtists(int year, int month) async {
  String url = latestArtists(year, month);
  http.Response res = await http.get(url);
  return parseLatestArtistsList(JSON.decode(res.body));
}
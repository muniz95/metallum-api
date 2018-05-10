import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:metallum/src/urls.dart';
import 'package:metallum/src/wrapper/artist.dart';
import 'package:metallum/src/wrapper/band.dart';
import 'package:metallum/src/wrapper/label.dart';

getLatestAddedBands(int year, int month) async {
  String url = latestAddedBands(year, month);
  http.Response res = await http.get(url);
  return parseLatestAddedBandsList(JSON.decode(res.body));
}

getLatestAddedLabels(int year, int month) async {
  String url = latestAddedLabels(year, month);
  http.Response res = await http.get(url);
  return parseLatestAddedLabelsList(JSON.decode(res.body));
}

getLatestAddedArtists(int year, int month) async {
  String url = latestAddedArtists(year, month);
  http.Response res = await http.get(url);
  return parseLatestAddedArtistsList(JSON.decode(res.body));
}
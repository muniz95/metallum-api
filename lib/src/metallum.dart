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

getLatestUpdatedBands(int year, int month) async {
  String url = latestUpdatedBands(year, month);
  http.Response res = await http.get(url);
  return parseLatestUpdatedBandsList(JSON.decode(res.body));
}

getLatestUpdatedLabels(int year, int month) async {
  String url = latestUpdatedLabels(year, month);
  http.Response res = await http.get(url);
  return parseLatestUpdatedLabelsList(JSON.decode(res.body));
}

getLatestUpdatedArtists(int year, int month) async {
  String url = latestUpdatedArtists(year, month);
  http.Response res = await http.get(url);
  return parseLatestUpdatedArtistsList(JSON.decode(res.body));
}

getBand(int id) async {
  String url = band(id);
  http.Response res = await http.get(url);
  return parseBandPage(res.body);
}
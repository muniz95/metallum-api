import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:metallum/src/urls.dart';
import 'package:metallum/src/wrapper/album.dart';
import 'package:metallum/src/wrapper/artist.dart';
import 'package:metallum/src/wrapper/band.dart';
import 'package:metallum/src/wrapper/label.dart';

getLatestAddedBands(int year, int month) async {
  String url = latestAddedBands(year, month);
  http.Response res = await http.get(url);
  return parseLatestAddedBandsList(jsonDecode(res.body));
}

getLatestAddedLabels(int year, int month) async {
  String url = latestAddedLabels(year, month);
  http.Response res = await http.get(url);
  return parseLatestAddedLabelsList(jsonDecode(res.body));
}

getLatestAddedArtists(int year, int month) async {
  String url = latestAddedArtists(year, month);
  http.Response res = await http.get(url);
  return parseLatestAddedArtistsList(jsonDecode(res.body));
}

getLatestUpdatedBands(int year, int month) async {
  String url = latestUpdatedBands(year, month);
  http.Response res = await http.get(url);
  return parseLatestUpdatedBandsList(jsonDecode(res.body));
}

getLatestUpdatedLabels(int year, int month) async {
  String url = latestUpdatedLabels(year, month);
  http.Response res = await http.get(url);
  return parseLatestUpdatedLabelsList(jsonDecode(res.body));
}

getLatestUpdatedArtists(int year, int month) async {
  String url = latestUpdatedArtists(year, month);
  http.Response res = await http.get(url);
  return parseLatestUpdatedArtistsList(jsonDecode(res.body));
}

getBand(String name, int id) async {
  String url = band(name, id);
  http.Response res = await http.get(url);
  return parseBandPage(res.body);
}

getBands({String name}) async {
  String url = bandsByName(name);
  http.Response res = await http.get(url);
  return parseBandSearchResultsPage(jsonDecode(res.body));
}

getAlbums({String name, String band}) async {
  String url = albumSearch(name: name, band: band);
  http.Response res = await http.get(url);
  return parseAlbumResults(jsonDecode(res.body));
}
import 'package:metallum/metallum.dart';
import 'package:metallum/src/util/date.dart';
import 'package:html/dom.dart';

List<Band> parseLatestAddedBandsList(Map<String, dynamic> payload) {
  List<Band> listBand = new List<Band>();
  for (List<String> row in payload['aaData']) {
    listBand.add(parseLatestAddedBand(row));
  }
  return listBand;
}

Band parseLatestAddedBand(List<String> row) {
  // String date = row[0];
  String name = new Element.html(row[1]).text;
  String country = new Element.html(row[2]).text;
  String genre = row[3];
  DateTime addedOn = parseFullDate(row[4], 2017);
  return new Band(
    name:name,
    country:country,
    genre:genre,
    addedOn:addedOn,
  );
}

List<Band> parseLatestUpdatedBandsList(Map<String, dynamic> payload) {
  List<Band> listBand = new List<Band>();
  for (List<String> row in payload['aaData']) {
    listBand.add(parseLatestUpdatedBand(row));
  }
  return listBand;
}

Band parseLatestUpdatedBand(List<String> row) {
  // String date = row[0];
  String name = new Element.html(row[1]).text;
  String country = new Element.html(row[2]).text;
  String genre = row[3];
  DateTime addedOn = parseFullDate(row[4], 2017);
  return new Band(
    name:name,
    country:country,
    genre:genre,
    addedOn:addedOn,
  );
}

import 'package:metallum/metallum.dart';
import 'package:metallum/src/util/date.dart';
import 'package:html/dom.dart';
import 'package:metallum/src/util/html_parser.dart';

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

Band parseBandPage(String html) {
  // String date = row[0];
  return parseBandPageDOM(parseStringToHTML(html));
}

Band parseBandPageDOM(Document document) {
  List<Element> floatLeft = document
    .querySelector('dl.float_left')
    .querySelectorAll('dd');
  List<Element> floatRight = document
    .querySelector('dl.float_right')
    .querySelectorAll('dd');
  String name = document.querySelector('.band_name').text;
  String country = floatLeft[0].text;
  String location = floatLeft[1].text;
  String status = floatLeft[2].text;
  int formedIn = int.parse(floatLeft[3].text);
  String genre = floatRight[0].text;
  String lyricalThemes = floatRight[1].text;
  String currentLabel = floatRight[2].text;
  return new Band(
    name: name,
    country: country,
    location: location,
    status: status,
    formedIn: formedIn,
    genre: genre,
    lyricalThemes: lyricalThemes,
    currentLabel: currentLabel,
  );
}

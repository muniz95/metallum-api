import 'package:metallum/metallum.dart';
import 'package:metallum/src/util/date.dart';
import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';
import 'package:metallum/src/util/html_parser.dart';

List<Band> parseBandList(Map<String, dynamic> payload) {
  List<Band> listBand = new List<Band>();
  for (List<String> row in payload['aaData']) {
    listBand.add(parseBand(row));
  }
  return listBand;
}

Band parseBand(List<String> row) {
  // String date = row[0];
  String name = new Element.html(row[1]).text;
  String country = new Element.html(row[2]).text;
  String genre = row[3];
  // DateTime addedOn = parseFullDate(row[4], 2017);
  return new Band(
    name:name,
    country:country,
    genre:genre,
    // addedOn:addedOn,
  );
}

import 'package:metallum/metallum.dart';
import 'package:metallum/src/util/date.dart';
import 'package:html/dom.dart';

List<Artist> parseLatestAddedArtistsList(Map<String, dynamic> payload) {
  List<Artist> listArtist = new List<Artist>();
  for (List<String> row in payload['aaData']) {
    listArtist.add(parseLatestAddedArtist(row));
  }
  return listArtist;
}

Artist parseLatestAddedArtist(List<String> row) {
  String name = new Element.html(row[1]).text;
  String country = new Element.html('<a>${row[2]}').text;
  List<Band> bands = row[3]
    .split(', ')
    .map((String bandName) => new Band(name: new Element.html(bandName).text))
    .toList();
  DateTime addedOn = parseFullDateTime(row[4]);
  return new Artist(
    name:name,
    country:country,
    bands:bands,
    addedOn:addedOn,
  );
}

List<Artist> parseLatestUpdatedArtistsList(Map<String, dynamic> payload) {
  List<Artist> listArtist = new List<Artist>();
  for (List<String> row in payload['aaData']) {
    listArtist.add(parseLatestUpdatedArtist(row));
  }
  return listArtist;
}

Artist parseLatestUpdatedArtist(List<String> row) {
  String name = new Element.html(row[1]).text;
  String country = new Element.html('<a>${row[2]}').text;
  List<Band> bands = row[3]
    .split(', ')
    .map((String bandName) => new Band(name: new Element.html(bandName).text))
    .toList();
  DateTime addedOn = parseFullDateTime(row[4]);
  return new Artist(
    name:name,
    country:country,
    bands:bands,
    addedOn:addedOn,
  );
}

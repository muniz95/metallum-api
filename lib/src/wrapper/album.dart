import 'package:metallum/metallum.dart';
import 'package:html/dom.dart';

List<Album> parseAlbumResults(Map<String, dynamic> payload) {
  List<Album> listAlbum = new List<Album>();
  for (List<dynamic> row in payload['aaData']) {
    listAlbum.add(parseAlbumResult(row));
  }
  return listAlbum;
}

Album parseAlbumResult(List<dynamic> row) {
  // String bandName = new Element.html(row[0]).text;
  String name = new Element.html(row[1]).text;
  String type = row[2];
  return new Album(
    name:name,
    type: type
  );
}

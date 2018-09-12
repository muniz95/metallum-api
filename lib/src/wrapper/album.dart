import 'package:metallum/metallum.dart';
import 'package:html/dom.dart';

List<Album> parseAlbumResults(Map<String, dynamic> payload) {
  List<Album> listAlbum = new List<Album>();
  for (List<String> row in payload['aaData']) {
    listAlbum.add(parseAlbumResult(row));
  }
  return listAlbum;
}

Album parseAlbumResult(List<String> row) {
  String name = new Element.html(row[1]).text;
  return new Album(
    name:name,
  );
}

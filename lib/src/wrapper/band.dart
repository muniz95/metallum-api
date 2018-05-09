import 'package:metallum/metallum.dart';
import 'package:metallum/src/util/date.dart';
import 'package:metallum/src/util/html_parser.dart';
import 'package:html/dom.dart';

List<Band> parseBandList(String html) {
  List<Band> listBand = new List<Band>();
  Document document = parseStringToHTML(html);
  List<Element> nodes = document
    .querySelectorAll('#bandList tr')
    // .where((Element e) => e.attributes.containsKey('class'))
    .toList();
  nodes.forEach((Element node) { listBand.add(parseBand(node)); });
  return listBand;
}

List<Band> parseLatestReleases(String html) {
  List<Band> listBand = new List<Band>();
  Document document = parseStringToHTML(html);
  List<Element> nodes = document.querySelectorAll('td table.News')[0].querySelectorAll('tr');
  nodes.removeRange(0, 1);
  nodes.forEach((Element node) { listBand.add(parseRelease(node)); });
  return listBand;
}

Band parseBand(Element el) {
  String name = el.children[0].text;
  String country = el.children[1].text;
  String genre = el.children[2].text;
  DateTime addedOn = parseFullDate(el.children[3].text, 2017);
  return new Band();
}

Band parseRelease(Element el) {
  return new Band();
}
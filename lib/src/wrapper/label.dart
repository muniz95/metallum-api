import 'package:metallum/metallum.dart';
import 'package:metallum/src/util/date.dart';
import 'package:html/dom.dart';

List<Label> parseLatestLabelsList(Map<String, dynamic> payload) {
  List<Label> listLabel = new List<Label>();
  for (List<String> row in payload['aaData']) {
    listLabel.add(parseLabel(row));
  }
  return listLabel;
}

Label parseLabel(List<String> row) {
  DateTime addedOn = parseMonthDay(row[0], 2018);
  String name = new Element.html(row[1]).text;
  String country = new Element.html(row[2]).text;
  String status = row[3];
  return new Label(
    name:name,
    country:country,
    status:status,
    addedOn:addedOn,
  );
}

import 'package:http/http.dart' as http;
import 'package:metallum/src/wrapper/band.dart';

getLatestBands() async {
  http.Response res = await http.get('https://www.metal-archives.com/archives/band-list/by/created');
  parseBandList(res.body);
}
import 'package:http/http.dart' as http;

getLatestBands() async {
  http.Response res = await http.get('https://www.metal-archives.com/archives/band-list/by/created');
  print(res.body);
}
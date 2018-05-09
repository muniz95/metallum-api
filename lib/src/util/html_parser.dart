import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

Document parseStringToHTML(String html) {
  return parse(html);
}

String buildURL(String baseURL, Map<String, dynamic> params) {
  if (params.length > 0) {
    baseURL += '?';
    params.keys.forEach((String key) {
      baseURL += '${key}=${params[key]}&';
    });
    int limit = baseURL.length - 1;
    baseURL.substring(0, limit);
  }

  return baseURL;
}
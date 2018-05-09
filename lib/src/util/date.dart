Map<String, int> monthNames = {
  'Jan': 1,
  'Feb': 2,
  'Mar': 3,
  'Apr': 4,
  'May': 5,
  'Jun': 6,
  'Jul': 7,
  'Ago': 8,
  'Sep': 9,
  'Oct': 10,
  'Nov': 11,
  'Dec': 12,
};

DateTime parseFullDate(String fullDate, int year) {
  List<String> shards = fullDate.split(' ');
  // Gets the first and second elements (month name and day)
  int month = monthNames[shards[0]];
  String dayParsed = shards[1].replaceAll(new RegExp(r'(th|st|nd|rd),'), '');
  int day = int.parse(dayParsed);

  return new DateTime(year, month, day);
}
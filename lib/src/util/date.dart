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

DateTime parseMonthDay(String fullDate, int year) {
  List<String> shards = fullDate.replaceAll('  ', ' ').split(' ');
  // Gets the first and second elements (month name and day)
  int month = monthNames[shards[0]];
  print(shards);
  int day = int.parse(shards[1]);

  return new DateTime(year, month, day);
}

DateTime parseFullDate(String fullDate, int year) {
  List<String> shards = fullDate.split(' ');
  // Gets the first and second elements (month name and day)
  int month = monthNames[shards[0]];
  String dayParsed = shards[1].replaceAll(new RegExp(r'(th|st|nd|rd),'), '');
  int day = int.parse(dayParsed);

  return new DateTime(year, month, day);
}

DateTime parseFullDateTime(String fullDate) {
  List<String> shards = fullDate.split(' ');
  // The first element is a YYYY-MM-DD date
  // The second element is a HH:mm-ss time
  List<String> dateShards = shards[0].split('-');
  List<String> timeShards = shards[1].split(':');
  int year = int.parse(dateShards[0]);
  int month = int.parse(dateShards[1]);
  int day = int.parse(dateShards[2]);
  int hours = int.parse(timeShards[0]);
  int minutes = int.parse(timeShards[1]);
  int seconds = int.parse(timeShards[2]);

  return new DateTime(year, month, day, hours, minutes, seconds);
}
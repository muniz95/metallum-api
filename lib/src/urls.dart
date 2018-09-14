final String BASEURL = 'https://www.metal-archives.com';
String latestAddedBands(int year, int month) => 
  '$BASEURL/archives/ajax-band-list/selection/$year-${month<10?'0'+month.toString():month}/by/created//json/1?sEcho=1';
String latestAddedLabels(int year, int month) => 
  '$BASEURL/archives/ajax-label-list/selection/$year-${month<10?'0'+month.toString():month}/by/created//json/1?sEcho=1';
String latestAddedArtists(int year, int month) => 
  '$BASEURL/archives/ajax-artist-list/selection/$year-${month<10?'0'+month.toString():month}/by/created//json/1?sEcho=1';
String latestUpdatedBands(int year, int month) => 
  '$BASEURL/archives/ajax-band-list/selection/$year-${month<10?'0'+month.toString():month}/by/modified//json/1?sEcho=1';
String latestUpdatedLabels(int year, int month) => 
  '$BASEURL/archives/ajax-label-list/selection/$year-${month<10?'0'+month.toString():month}/by/modified//json/1?sEcho=1';
String latestUpdatedArtists(int year, int month) => 
  '$BASEURL/archives/ajax-artist-list/selection/$year-${month<10?'0'+month.toString():month}/by/modified//json/1?sEcho=1';
String band(String name, int id) => '$BASEURL/bands/$name/$id';
String bandsByName(String name) => '$BASEURL/search/ajax-band-search/?field=name&query=${name}&sEcho=1';
String albumSearch({String name, String band, int startYear, int startMonth, int endYear, int endMonth, String country,
  String location, String label, String catalog, String identifiers, String recordingInfo, String description, String notes, String genre}) =>
  '$BASEURL/search/ajax-advanced/searching/albums/?bandName=${band != null ? band : ""}&releaseTitle=${name != null ? name : ""}&releaseYearFrom=${startYear != null ? startYear : ""}&releaseMonthFrom=${startMonth != null ? startMonth : ""}&releaseYearTo=${endYear != null ? endYear : ""}&releaseMonthTo=${endMonth != null ? endMonth : ""}&country=${country != null ? country : ""}&location=${location != null ? location : ""}&releaseLabelName=${label != null ? label : ""}&releaseCatalogNumber=${catalog != null ? catalog : ""}&releaseIdentifiers=${identifiers != null ? identifiers : ""}&releaseRecordingInfo=${recordingInfo != null ? recordingInfo : ""}&releaseDescription=${description != null ? description : ""}&releaseNotes=${notes != null ? notes : ""}&genre=${genre != null ? genre : ""}&sEcho=1';
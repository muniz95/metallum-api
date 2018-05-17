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
String band(int id) => '$BASEURL/band?id=$id';
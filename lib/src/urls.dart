final String BASEURL = 'https://www.metal-archives.com';
String latestBands(int year, int month) => 
  '$BASEURL/archives/ajax-band-list/selection/$year-${month<10?'0'+month.toString():month}/by/created//json/1?sEcho=1';
String latestLabels(int year, int month) => 
  '$BASEURL/archives/ajax-label-list/selection/$year-${month<10?'0'+month.toString():month}/by/created//json/1?sEcho=1';
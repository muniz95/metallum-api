import 'package:metallum/metallum.dart';

main() async {
  // List<Band> bands = await getLatestBands(new DateTime.now().year, new DateTime.now().month);
  // bands.forEach(print);
  // List<Label> labels = await getLatestLabels(new DateTime.now().year, new DateTime.now().month);
  // labels.forEach(print);
  List<Artist> artists = await getLatestArtists(new DateTime.now().year, new DateTime.now().month);
  artists.forEach(print);
}

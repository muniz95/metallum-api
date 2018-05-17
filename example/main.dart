import 'package:metallum/metallum.dart';

main() async {
  // List<Band> bands = await getLatestAddedBands(new DateTime.now().year, new DateTime.now().month);
  // bands.forEach(print);
  // List<Label> labels = await getLatestAddedLabels(new DateTime.now().year, new DateTime.now().month);
  // labels.forEach(print);
  // List<Artist> artists = await getLatestAddedArtists(new DateTime.now().year, new DateTime.now().month);
  // artists.forEach(print);
  // List<Band> bands = await getLatestUpdatedBands(new DateTime.now().year, new DateTime.now().month);
  // bands.forEach(print);
  // List<Label> labels = await getLatestUpdatedLabels(new DateTime.now().year, new DateTime.now().month);
  // labels.forEach(print);
  // List<Artist> artists = await getLatestAddedArtists(new DateTime.now().year, new DateTime.now().month);
  // artists.forEach(print);
  Band band = await getBand('Metallica', 125);
  print(band);
}

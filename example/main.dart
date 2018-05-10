import 'package:metallum/metallum.dart';

main() async {
  List<Band> bands = await getLatestBands(new DateTime.now().year, new DateTime.now().month);
  bands.forEach(print);
}

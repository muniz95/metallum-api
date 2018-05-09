import 'package:metallum/metallum.dart';

main() async {
  print('Heavy Metal is the law!');
  List<Band> bands = await getLatestBands();
  bands.forEach(print);
}

import 'package:metallum/metallum.dart';
import 'package:test/test.dart';

void main() {
  group('Band methods', () {
    test('should bring info about Metallica', () async {
      Band band = await getBand('Metallica', 125);
      expect(band.name, 'Metallica');
      expect(band.formedIn, 1981);
    });
    test('should bring a lot of bands', () async {
      Band band = await getBand('Metallica', 125);
      expect(band.name, 'Metallica');
      expect(band.formedIn, 1981);
    });
  });
}
import 'package:metallum/metallum.dart';
import 'package:test/test.dart';

void main() {
  group('Band', () {
    group('search', () {
      test('should bring info about Metallica', () async {
        Band band = await getBand('Metallica', 125);
        expect(band.name, 'Metallica');
        expect(band.formedIn, 1981);
      });
      test('should bring a lot of bands', () async {
        List<Band> bandsNamedMayhem = await getBands(name: 'Mayhem');
        expect(bandsNamedMayhem.length, greaterThanOrEqualTo(10));
      });
      test('should bring at least one Mayhem from Norway', () async {
        List<Band> bandsNamedMayhem = await getBands(name: 'Mayhem');
        int counter = bandsNamedMayhem.where((Band b) => b.country == 'Norway').length;
        expect(counter, greaterThanOrEqualTo(1));
      });
      test('should bring at least one death metal band', () async {
        expect(false, true);
      });
      test('should bring at least one band from Brazil', () async {
        expect(false, true);
      });
      test('should bring at least one band that sings/plays about fantasy-related themes', () async {
        expect(false, true);
      });
      test('should bring at least one band formed between 1990 and 2000', () async {
        expect(false, true);
      });
      test('should bring at least one band that has disbanded', () async {
        expect(false, true);
      });
      test('should bring at least one band signed under an indie label', () async {
        expect(false, true);
      });
    });
  });
}
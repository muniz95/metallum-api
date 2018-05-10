import 'package:metallum/metallum.dart';

class Artist {
  final int id;
  final String name;
  final String fullName;
  final int age;
  final String country;
  final String gender;
  final List<Band> bands;
  final DateTime addedOn;

  Artist({
    this.id,
    this.name,
    this.fullName,
    this.age,
    this.country,
    this.gender,
    this.bands,
    this.addedOn,
  });

  toString() => '$name from $country, plays in ${bands.length} band${bands.length>1?'s':''}';
}
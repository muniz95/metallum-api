class Label {
  final int id;
  final String name;
  final String status;
  final String country;
  final DateTime addedOn;
  final String addedBy;

  Label({
    this.id,
    this.name,
    this.status,
    this.country,
    this.addedOn,
    this.addedBy,
  });

  toString() => '$name - $country';
}
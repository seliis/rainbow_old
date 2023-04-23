class ScannedItem {
  const ScannedItem({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  ScannedItem copyWith({
    String? id,
    String? name,
  }) {
    return ScannedItem(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

class CarriedItem {
  const CarriedItem({
    required this.id,
    required this.time,
    required this.name,
    required this.person,
    required this.location,
  });

  final String id;
  final String time;
  final String name;
  final String person;
  final String location;

  CarriedItem copyWith({
    String? id,
    String? time,
    String? name,
    String? person,
    String? location,
  }) {
    return CarriedItem(
      id: id ?? this.id,
      time: time ?? this.time,
      name: name ?? this.name,
      person: person ?? this.person,
      location: location ?? this.location,
    );
  }
}

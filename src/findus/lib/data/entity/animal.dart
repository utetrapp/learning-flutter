import 'package:equatable/equatable.dart';

class Animal extends Equatable {
  const Animal(
      {required this.animalId,
      required this.name,
      required this.race,
      required this.owner,
      required this.image});

  final int animalId;
  final String name;
  final String race;
  final String owner;
  final String image;

  @override
  List<Object?> get props => [animalId, name, race, owner, image];

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
      animalId: json['animal_id'],
      name: json['name'],
      race: json['race'],
      owner: json['owner'],
      image: json['image']);

  Map<String, dynamic> toJson() => {
        'animal': {
          'animal_id': animalId,
          'name': name,
          'race': race,
          'owner': owner,
          'image': image
        }
      };
}

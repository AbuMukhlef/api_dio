import 'package:api_dio/data/model/rick_and%20_morty/location.dart';
import 'package:api_dio/data/model/rick_and%20_morty/origin.dart';

class RickMorty {
  final List<Result> results;

  RickMorty({
    required this.results,
  });

  factory RickMorty.fromJson(Map<String, dynamic> json) {
    return RickMorty(
      results: List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  final int id;
  final String name;
  final String status;
  final String species;
  final String? type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  Result({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: Origin.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode'].map((x) => x)),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
}
}

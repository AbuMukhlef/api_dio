import 'package:api_dio/data/model/rick_and%20_morty/info.dart';
import 'package:api_dio/data/model/rick_and%20_morty/result.dart';

class RickMorty {
  final List<Result> results;
  final Info info;

  RickMorty({
    required this.info,
    required this.results,
  });

  factory RickMorty.fromJson(Map<String, dynamic> json) {
    return RickMorty(
      info: Info.fromJson(json['info']),
      results:
          List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
    );
  }
}

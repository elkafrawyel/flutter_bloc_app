import 'package:flutter_bloc_app/data/api/actors_api.dart';
import 'package:flutter_bloc_app/data/models/actor.dart';

class ActorsRepo {
  final ActorsApi actorsApi;

  ActorsRepo(this.actorsApi);
  Future<List<Actor>> getAllActors() async {
    final actors = await actorsApi.getAllActors();
    return actors.map((e) => Actor.fromJson(e)).toList();
  }
}

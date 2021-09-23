import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/data/models/actor.dart';
import 'package:flutter_bloc_app/data/repo/actors_repo.dart';
import 'package:meta/meta.dart';

part 'actor_state.dart';

class ActorCubit extends Cubit<ActorState> {
  final ActorsRepo actorsRepo;
  ActorCubit(this.actorsRepo) : super(ActorInitial());
  getAllActors() async {
    emit(ActorLoading());
    List<Actor> actors = await actorsRepo.getAllActors();

    /// like update in getx
    emit(ActorLoaded(actors));
  }
}

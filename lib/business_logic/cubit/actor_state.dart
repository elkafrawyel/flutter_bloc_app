part of 'actor_cubit.dart';

@immutable
abstract class ActorState {}

class ActorInitial extends ActorState {}

class ActorLoading extends ActorState {}

class ActorLoaded extends ActorState {
  final List<Actor> actors;

  ActorLoaded(this.actors);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/business_logic/cubit/actor_cubit.dart';
import 'package:flutter_bloc_app/data/api/actors_api.dart';
import 'package:flutter_bloc_app/data/repo/actors_repo.dart';
import 'package:flutter_bloc_app/ui/helper/constants.dart';
import 'package:flutter_bloc_app/ui/screens/actors_details_screen.dart';
import 'package:flutter_bloc_app/ui/screens/actors_screen.dart';

class AppRouter {
  late ActorsRepo actorsRepo;
  late ActorCubit actorCubit;

  AppRouter() {
    actorsRepo = ActorsRepo(ActorsApi());
    actorCubit = ActorCubit(actorsRepo);
  }

  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case actorsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => actorCubit,
            child: ActorsScreen(),
          ),
        );
      case actorDetailsScreen:
        return MaterialPageRoute(builder: (_) => ActorDetailsScreen());
    }
  }
}

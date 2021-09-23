import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/business_logic/cubit/actor_cubit.dart';
import 'package:flutter_bloc_app/data/models/actor.dart';
import 'package:flutter_bloc_app/ui/helper/constants.dart';
import 'package:flutter_bloc_app/ui/widgets/actor_card.dart';

class ActorsScreen extends StatefulWidget {
  const ActorsScreen({Key? key}) : super(key: key);

  @override
  _ActorsScreenState createState() => _ActorsScreenState();
}

class _ActorsScreenState extends State<ActorsScreen> {
  List<Actor> allActors = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ActorCubit>(context).getAllActors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actors',
          style: TextStyle(
            color: myGrey,
          ),
        ),
        backgroundColor: myYellow,
      ),
      body: BlocBuilder<ActorCubit, ActorState>(builder: (context, state) {
        if (state is ActorLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ActorLoaded) {
          allActors = (state).actors;
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: myGrey,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: allActors.length,
                itemBuilder: (context, index) =>
                    ActorCard(actor: allActors[index])),
          );
        } else {
          return Center(
            child: Text('Error'),
          );
        }
      }),
    );
  }
}

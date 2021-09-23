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
  List<Actor> searchList = [];
  bool isSearhing = false;
  final _searchTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ActorCubit>(context).getAllActors();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:isSearching?ackButton(color:myGrey):SizedBox()
      
        title: isSearhing ? _buildSearchField() : _buildAppbarTitle(),
        backgroundColor: myYellow,
        actions: buildAppbarActions(),
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

  Widget _buildAppbarTitle() {
    return Text(
      'Actors',
      style: TextStyle(
        color: myGrey,
      ),
    );
  }

  List<Widget> buildAppbarActions() {
    if (isSearhing) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: myGrey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            _startSearch();
          },
          icon: Icon(
            Icons.search,
            color: myGrey,
          ),
        )
      ];
    }
  }

  _buildSearchField() => TextFormField(
        controller: _searchTextEditingController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: 'Find an actor...',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          searchList = allActors
              .where((element) =>
                  element.name.toLowerCase().contains(value.toLowerCase()))
              .toList();
          setState(() {});
        },
      );

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearhing = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearhing = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextEditingController.clear();
    });
  }
}

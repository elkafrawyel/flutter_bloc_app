import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/data/models/actor.dart';
import 'package:flutter_bloc_app/ui/helper/constants.dart';

class ActorCard extends StatelessWidget {
  final Actor actor;
  const ActorCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration:
          BoxDecoration(color: myWhite, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        child: Container(
          color: myGrey,
          child: actor.img.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: actor.img,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/placeholder.png'),
        ),
        footer: Container(
          // height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: Colors.black45,
          alignment: AlignmentDirectional.bottomCenter,
          child: Text(
            actor.name,
            style: TextStyle(
              height: 1.3,
              color: myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

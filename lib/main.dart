import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/app_routers.dart';

void main() {
  runApp(FlutterBlocApp(
    appRouter: AppRouter(),
  ));
}

class FlutterBlocApp extends StatelessWidget {
  final AppRouter appRouter;

  const FlutterBlocApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

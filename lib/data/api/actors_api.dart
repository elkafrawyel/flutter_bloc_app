import 'package:dio/dio.dart';
import 'package:flutter_bloc_app/ui/helper/constants.dart';

class ActorsApi {
  late Dio dio;

  ActorsApi() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
    );

    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllActors() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

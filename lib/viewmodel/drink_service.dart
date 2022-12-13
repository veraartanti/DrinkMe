import 'package:dio/dio.dart';

import '../model/Drinks.dart';

import '../model/Favorite.dart';
import '../model/User.dart';

class DrinkService {
  final String baseUrlApi = "http://192.168.0.123:3000/api";

  Future<List<DrinkModel>> fetchDataDrink() async {
    Response response = await Dio().get("$baseUrlApi/drink/all");
    List<DrinkModel> drinks =
        (response.data as List).map((v) => DrinkModel.fromJSON(v)).toList();
    return drinks;
  }

  Future<List<DrinkModel>> fetchDataDrinkType(String type) async {
    Response response = await Dio().get("$baseUrlApi/drink/place/$type");
    List<DrinkModel> drinks =
        (response.data as List).map((v) => DrinkModel.fromJSON(v)).toList();
    return drinks;
  }
}

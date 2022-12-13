import 'package:dio/dio.dart';

import '../model/Drinks.dart';

import '../model/Favorite.dart';
import '../model/User.dart';

class FavoriteService {
  final String baseUrlApi = "http://192.168.30.227:3000/api";

  Future<List<FavoriteModelDetail>> fetchDataFavorite(
      int drinkId, int userId) async {
    Response response =
        await Dio().get("$baseUrlApi/bookmark/$drinkId/$userId");

    List<FavoriteModelDetail> favorites = (response.data as List)
        .map((v) => FavoriteModelDetail.fromJSON(v))
        .toList();
    return favorites;
  }

  Future<List<FavoriteModel>> fetchDataFavoriteComic(int userId) async {
    Response response = await Dio().get("$baseUrlApi/bookmark/user/$userId");

    List<FavoriteModel> favoritelist =
        (response.data as List).map((v) => FavoriteModel.fromJSON(v)).toList();
    return favoritelist;
  }

  Future<List<FavoriteModel>> fetchDataFavoriteComicType(
      int userId, String type) async {
    Response response =
        await Dio().get("$baseUrlApi/bookmark/user/$userId/$type");

    List<FavoriteModel> favoritelist =
        (response.data as List).map((v) => FavoriteModel.fromJSON(v)).toList();
    return favoritelist;
  }
}

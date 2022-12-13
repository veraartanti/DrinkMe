import 'package:dio/dio.dart';
import '../model/User.dart';

class UserService {
  final String baseUrlApi = "http://192.168.0.123:3000/api";

  Future<List<UserModel>> fetchDataUser(int idUser) async {
    Response response = await Dio().get("$baseUrlApi/user/$idUser");
    List<UserModel> user =
        (response.data as List).map((v) => UserModel.fromJSON(v)).toList();
    return user;
  }
}

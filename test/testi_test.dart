/*
  Mengolah data json dari http request menggunakan JSON

  Notes
  - lokasi file ini terletak pada ./test/namabebas_test.dart
  - nama file ini harus ada namabebas_test.dart

*/

// 1. install package dio terlebih dahulu, dan import ke sini
import 'dart:convert';
import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();
  // var response = await dio
  //     .get('https://uasmobilev-default-rtdb.firebaseio.com/users/data.json');
  // var dataResponse = response.data;

  // var emails = "mhrini@gmail.com";
  // for (int index = 0; index < dataResponse.length; index++) {
  //   if (dataResponse[index]['email'] == emails) {
  //     print(dataResponse[index]['email']);
  //   } else {
  //     print("Email tidak ditemukan");
  //   }
  // }
}

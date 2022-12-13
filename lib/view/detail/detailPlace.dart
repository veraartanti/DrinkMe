import 'package:dio/dio.dart';
import 'package:drinkme/model/Drinks.dart';
import 'package:drinkme/view/detail/detailDrink.dart';
import 'package:drinkme/viewmodel/drink_service.dart';
import 'package:drinkme/viewmodel/favorite_service.dart';
import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import '../../model/Favorite.dart';
import '../../model/User.dart';

import '../profile/profile.dart';

class DetailPlace extends StatefulWidget {
  final DrinkModel drink;
  String place;
  int user;

  DetailPlace({
    Key? key,
    required this.drink,
    required this.user,
    required this.place,
  }) : super(key: key);

  @override
  State<DetailPlace> createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<DetailPlace> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DrinkModel>>(
      future: DrinkService().fetchDataDrinkType(widget.place),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: black,
                  iconTheme: const IconThemeData(color: white),
                ),
                body: Container(
                    color: black,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailDrink(
                                              drink: snapshot.data![index],
                                              user: widget.user,

                                              // studio: StudioModel(id: s,name: )
                                            )));
                              },
                              child: Container(
                                color: white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 190,
                                      width: 400,
                                      child: Image.network(
                                        snapshot.data![index].cover,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 280),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].drink_name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: black),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              snapshot.data![index].place_name,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: black,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        )),
                                  ],
                                ),
                              ));
                        })));
          }
        }
      },
    );
  }
}

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   child: Icon(Icons.favorite, color: favIconcolor),
      //   onPressed: () {
      //     setState(() {
      //       if (favIconcolor == Colors.grey) {
      //         favIconcolor = Colors.red.shade700;
      //       } else {
      //         favIconcolor = Colors.grey;
      //       }
      //     });
      //   },
      // ),


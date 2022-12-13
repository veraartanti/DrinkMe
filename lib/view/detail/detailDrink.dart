import 'package:dio/dio.dart';
import 'package:drinkme/model/Drinks.dart';
import 'package:drinkme/viewmodel/drink_service.dart';
import 'package:drinkme/viewmodel/favorite_service.dart';
import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import '../../model/Favorite.dart';
import '../../model/User.dart';

import '../profile/profile.dart';

class DetailDrink extends StatefulWidget {
  final DrinkModel drink;
  int user;

  DetailDrink({
    Key? key,
    required this.drink,
    required this.user,
  }) : super(key: key);

  @override
  State<DetailDrink> createState() => _DetailDrinkState();
}

class _DetailDrinkState extends State<DetailDrink> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              width: 395,
              height: 470,
              child: Image.network(
                widget.drink.cover,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("${widget.drink.drink_name}",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Text(
                        "Asal : ${widget.drink.place_name}",
                        style:
                            TextStyle(color: Color.fromARGB(255, 49, 49, 49)),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 210),
                        child: Container(
                            height: 40,
                            width: 140,
                            color: Colors.blueAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Serve : ${widget.drink.preparation}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                "${widget.drink.description}",
                style: Theme.of(context).textTheme.bodyText1,
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        )));
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


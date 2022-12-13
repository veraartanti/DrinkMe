import 'package:drinkme/constant/constant.dart';
import 'package:drinkme/model/Drinks.dart';
import 'package:drinkme/view/detail/detailPlace.dart';
import 'package:drinkme/viewmodel/drink_service.dart';
import 'package:flutter/material.dart';

import '../../model/User.dart';
import '../../navigator/tab.dart';
import '../detail/detailDrink.dart';

class Home extends StatefulWidget {
  // final UserModel user;
  int user;
  Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  var lastIndex;

  @override
  Widget build(BuildContext context) {
    Widget tabPlace = FutureBuilder<List<DrinkModel>>(
      future: DrinkService().fetchDataDrink(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
              color: white,
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPlace(
                                        drink: snapshot.data![index],
                                        user: widget.user,
                                        place: snapshot.data![index].place_name,

                                        // studio: StudioModel(id: s,name: )
                                      )));
                        },
                        child: Container(
                            child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPlace(
                                          drink: snapshot.data![index],
                                          user: widget.user,
                                          place:
                                              snapshot.data![index].place_name,

                                          // studio: StudioModel(id: s,name: )
                                        )));
                          },
                          child: Text(snapshot.data![index].place_name),
                        )));
                  }),
            );
          }
        }
      },
    );

    Widget tabSemua = FutureBuilder<List<DrinkModel>>(
      future: DrinkService().fetchDataDrink(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
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
                                  // decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //   fit: BoxFit.fill,
                                  //   image: AssetImage(snapshot.data![index].cover),
                                  // )),
                                  child: Image.network(
                                    snapshot.data![index].cover,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                    padding: const EdgeInsets.only(right: 280),
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
                                            fontWeight: FontWeight.w400,
                                            color: black,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    )),
                              ],
                            ),
                          ));
                    }));
          }
        }
      },
    );

    return TabsController(
      Tab1: tabSemua,
      Tab2: tabPlace,
      user: widget.user,
    );
  }
}

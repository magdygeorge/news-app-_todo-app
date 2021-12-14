import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: Icon(
            Icons.menu,
          ),
          title: Text(
            "First App",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            Icon(Icons.ac_unit),
          ],
        ),
        body: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(
                        image: AssetImage("images/hel.jpg"),
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10
                        ),
                        color: Colors.black.withOpacity(0.7),
                          width: 200.0,
                          child: Text(
                        "Cat",
                        style: TextStyle(fontSize: 20,color: Colors.white),
                            textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

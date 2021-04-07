import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:overlay_support/overlay_support.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animationController!.addListener(() {
      setState(() {});
      // print(_animationController!.value);
    });
    _animationController!.repeat();
  }

  Widget buildList() {
    final percentage = (_animationController?.value ?? 0) * 100;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFFF1F1F1), width: 3)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Expanded(flex: 1, child: Icon(Icons.access_alarm)),
              Expanded(
                flex: 1,
                child: Image.asset(
                  "assets/images/pkg_icon.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Changing Lens - Large Vehicele",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSubList(),
                        // buildSubList(),
                        // buildSubList(),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 10.0,
                      child: LiquidLinearProgressIndicator(
                        value: _animationController?.value ?? 0,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation(Color(0xFF2980b9)),
                        borderRadius: 12.0,
                        center: Text(
                          "${percentage.toStringAsFixed(0)}%",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 7.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // LiquidLinearProgressIndicator(
                    //   value: _animationController?.value ?? 0,
                    //   valueColor: AlwaysStoppedAnimation(Colors
                    //       .pink), // Defaults to the current Theme's accentColor.
                    //   backgroundColor: Colors
                    //       .white, // Defaults to the current Theme's backgroundColor.
                    //   borderColor: Colors.blue,
                    //   borderWidth: 0.0,
                    //   borderRadius: 12.0,
                    //   direction: Axis
                    //       .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                    //   center: Text("Loading..."),
                    // )
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xFF27ae60),
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xFFe74c3c),
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              Icons.pause,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xFFf39c12),
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              Icons.stop,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container buildSubList() {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.alarm_outlined,
            color: Colors.cyan,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Access Expires in 20 hour",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }

  Expanded buildHeaderMenu() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xFFF1F1F1), width: 3),
                left: BorderSide(color: Color(0xFFF1F1F1), width: 3))),
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.play_arrow_rounded),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "18",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Available Courses",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Add more to your library",
                    style: TextStyle(fontSize: 10, color: Color(0xFF80B5F1)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      flex: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFFFFF),
        child: Column(
          children: [
            // Image.network(
            //   "https://cdn2.iconfinder.com/data/icons/game-device-2/512/ps4_and_ps4_controller_512.png",
            //   width: 120,
            // ),
            Row(
              children: [
                buildHeaderMenu(),
                buildHeaderMenu(),
                buildHeaderMenu(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color(0xFFF7F7F7),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFF7F7F7), width: 10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFFF7F7F7), width: 2.0),
                            ),
                            hintText: 'Enter a search term'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                      buildList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

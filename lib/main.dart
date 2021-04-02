import 'dart:io';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:window_size/window_size.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:ping_discover_network/ping_discover_network.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter_ip/flutter_ip.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // setWindowFrame(Rect.fromLTRB(1200.0, 500.0, 1800.0, 1125.0));
    setWindowMinSize(const Size(1280, 500));
    setWindowMaxSize(Size.infinite);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController? _animationController;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animationController!.addListener(() {
      print(23423423423);
      // setState(() {})
      //
      print(_animationController!.value);
    });
    _animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFF0E2C4F),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  buildMenuItem(isActive: true),
                  buildMenuItem(),
                  buildMenuItem()
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Color(0xFFFFFFFF),
              child: Column(
                children: [
                  Image.network(
                    "https://cdn2.iconfinder.com/data/icons/game-device-2/512/ps4_and_ps4_controller_512.png",
                    width: 120,
                  ),
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
                        Container(
                          child: InkWell(
                            child: Container(
                              width: 100,
                              padding: const EdgeInsets.all(10),
                              child: Row(children: [
                                Icon(Icons.sort_outlined),
                                Text("Sort")
                              ]),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFF7F7F7),
                                  border: Border.all(color: Colors.grey)),
                            ),
                          ),
                        ),
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

  void analyze() async {
    var ips = await NetworkInterface.list();
    var ip = ips[0].addresses[0].address;
    final String subnet = ip.substring(0, ip.lastIndexOf('.'));
    // remote address pkg installer port default
    final int port = 12800;

    final stream = NetworkAnalyzer.discover2(subnet, port);
    stream.listen((NetworkAddress addr) {
      if (addr.exists) {
        print('Found device: ${addr.ip}');
      }
    });
  }

  Container buildMenuItem({bool isActive = false}) {
    return Container(
      decoration: isActive
          ? BoxDecoration(
              border: Border(left: BorderSide(color: Colors.white, width: 3)))
          : null,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.airplay,
            color: Colors.white,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "Courses",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }

  void onClick() {
    analyze();
    // popup a toast.
    toast('Hello world!');

    // show a notification at top of screen.
    showSimpleNotification(Text("this is a message from simple notification"),
        background: Colors.green, position: NotificationPosition.bottom);
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
                child: Image.network(
                  "https://i.imgur.com/3JtKV36.png",
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
                        buildSubList(),
                        buildSubList(),
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
}

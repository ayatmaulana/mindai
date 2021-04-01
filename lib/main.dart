import 'dart:io';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:window_size/window_size.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:ping_discover_network/ping_discover_network.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter_ip/flutter_ip.dart';
import 'package:dartspatcher/dartspatcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowFrame(Rect.fromLTRB(1200.0, 500.0, 1800.0, 1125.0));
    setWindowMinSize(const Size(1280, 500));
    setWindowMaxSize(Size.infinite);
  }

  Dartspatcher dartspatcher = Dartspatcher();
  dartspatcher.locals['var'] = 'value';

  dartspatcher.setVirtualDirectory('web');

  dartspatcher.get('/', [
    (HttpRequest request, Map<String, dynamic> params, Function next,
        [Map<dynamic, dynamic>? locals]) {
      print("fire");
      request.response.close();
    }
  ], {
    'var': 'value'
  });

  dartspatcher.setMiddleware([
    (HttpRequest request, Map<String, dynamic> params, Function next,
        [Map<dynamic, dynamic>? locals]) {
      print('middlware 2');
    }
  ]);

  dartspatcher.setErrorHandler((HttpRequest request, dynamic e, StackTrace s) {
    print('Error Handler');
    dartspatcher.close(request, HttpStatus.internalServerError);
  });

  dartspatcher.listen(InternetAddress.loopbackIPv4, 4040, (HttpServer server) {
    print('Listening on localhost:${server.port}');
  });
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
            flex: 3,
            child: Container(
              color: Color(0xFFFFFFFF),
              child: Scrollbar(
                child: SingleChildScrollView(
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
          )
        ],
      ),
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
              Expanded(flex: 1, child: Icon(Icons.access_alarm)),
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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSubList(),
                        buildSubList(),
                        buildSubList(),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child:
                      FlatButton(onPressed: onClick, child: Text("Press Me"))),
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

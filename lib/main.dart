import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:mindain/pages/log.dart';
import 'package:mindain/pages/main.dart';
import 'package:mindain/partials/menu.dart';
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
    setWindowMinSize(const Size(1000, 500));
    setWindowMaxSize(Size.infinite);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: CupertinoApp(
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Menu(),
          ),
          Expanded(
              flex: 4,
              child: Builder(builder: (BuildContext context) {
                return Main();
              }))
        ],
      ),
    );
  }
}

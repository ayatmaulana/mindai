import 'dart:io';
import 'package:ping_discover_network/ping_discover_network.dart';

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

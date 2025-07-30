import 'package:flutter/material.dart';
import 'package:my_page/page/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrintRebuildDirtyWidgets = true;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'neo'),
      home: Home(),
    ),
  );
}

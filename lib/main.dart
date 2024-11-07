import 'package:file_picker_example/di/service_locator.dart';
import 'package:file_picker_example/screens/file_picker_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Picker Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FilePickerPage(),
    );
  }
}


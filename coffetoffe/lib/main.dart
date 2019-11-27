import 'package:flutter/material.dart';
import 'package:coffetoffe/pages/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  Colors.brown,
      ),
      home: Login(),
    )
  );
}

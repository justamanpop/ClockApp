import 'package:flutter/material.dart';
import 'package:customclockapp/Pages/currenttime.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => CurrentTime(),
    },
  ));
}
import 'package:flutter/material.dart';
import 'package:spy_for_kavacik/ui/gameplay.dart';
import 'ui/index.dart';
import 'models/oyun.dart';
void main() => runApp(MaterialApp(
  title: "Spy",
  initialRoute: '/',
  routes: {
    '/Gameplay': (contex) => Gameplay()
  },

  theme: ThemeData(
    primarySwatch: Colors.cyan,
    brightness: secim,
  ),
  home: index()
));


import 'package:flutter/material.dart';
import 'package:hana/router_configuration.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RouterConfiguration();
  }
}

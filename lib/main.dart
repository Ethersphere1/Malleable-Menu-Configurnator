import 'package:flutter/material.dart';

import 'config_items.dart';

void main() {
  runApp(const Config());
}

class Config extends StatelessWidget {
  const Config({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Configurnator',
      home: ConfigurationItems(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:untitled6/core/service_locator.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  runApp(const MyApp());
}

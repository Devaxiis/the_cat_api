import 'package:flutter/material.dart';
import 'package:learn_pagination/app.dart';
import 'core/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();

  runApp(const UserApp());
} 
import 'package:Project_Catalog/Views/ProjectCatalogApp.dart';
import 'package:Project_Catalog/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new ProjectCatalogApp(DEFAULT_LANGUAGE_CODE));
}

import 'package:flutter/material.dart';
import 'SignInView.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:Project_Catalog/app_localizations.dart';
import 'package:Project_Catalog/app_state.dart';

import 'SplashView.dart';

// ignore: must_be_immutable
class ProjectCatalogApp extends StatefulWidget {
  var language;

  ProjectCatalogApp(this.language);

  @override
  _ProjectCatalogAppState createState() => _ProjectCatalogAppState();
}

class _ProjectCatalogAppState extends State<ProjectCatalogApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(widget.language),
      child: Consumer<AppState>(builder: (context, provider, builder) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: [
            Locale('en', ''),
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            return Locale(Provider.of<AppState>(context).selectedLanguageCode);
          },
          locale: Provider.of<AppState>(context).locale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          home: SplashView(),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: SBehavior(),
              child: child,
            );
          },
        );
      }),
    );
  }
}

class SBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

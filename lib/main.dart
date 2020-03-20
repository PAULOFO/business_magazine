import 'package:businessmagazine/blocs/drawer_bloc.dart';
import 'package:businessmagazine/blocs/home_bloc.dart';
import 'package:businessmagazine/screens/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {


    return MultiProvider(//Para ser acessível de qualquer lugar do app
      providers: [
        Provider<DrawerBloc>(
          create:(_) => DrawerBloc(),//Quando se tem um context mas não se utiliza usa (_)
          dispose: (context, value) => value.dispose(),
        ),
        Provider<HomeBloc>(
          create:(_) => HomeBloc(),//Quando se tem um context mas não se utiliza usa (_)
          dispose: (context, value) => value.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'BUZINESS MAGAZINE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //primaryColor: Color(0xFF692CD5),
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pt', 'BR')
        ],
        home: BaseScreen(),
      ),
    );
  }
}


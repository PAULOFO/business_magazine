import 'dart:async';
import 'package:businessmagazine/blocs/drawer_bloc.dart';
import 'package:businessmagazine/screens/account/account_screen.dart';
import 'package:businessmagazine/screens/create/create_screen.dart';
import 'package:businessmagazine/screens/home/home_screen.dart';
import'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  final PageController _pageController = PageController();

  DrawerBloc _drawerBloc;
  StreamSubscription _drawerSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final DrawerBloc drawerBloc = Provider.of<DrawerBloc>(context);
    if(drawerBloc != _drawerBloc){
      _drawerBloc = drawerBloc;//Salva o drawerBloc novo

      _drawerSubscription?.cancel();
      _drawerSubscription = _drawerBloc.outPage.listen((page){
        try{
          _pageController.jumpToPage(page);
        } catch (e) {}
      });
    }

  }


  @override
  void dispose() {
    _drawerSubscription.cancel();//Para matar a tela
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),//IMPEDE DESLIZAR A TELA
        children: <Widget>[
          HomeScreen(),
          CreateScreen(),
          Container(color: Colors.blue,),
          Container(color: Colors.red,),
          AccountScreen(),
        ],
      ),
    );
  }
}

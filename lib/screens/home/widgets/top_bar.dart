import 'package:businessmagazine/screens/filter/filter_screen.dart';
import 'package:businessmagazine/screens/home/widgets/bar_button.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey[400],
          blurRadius: 20.0,
          offset: Offset(
            0,
            3,
          ), //deslocamento em x e y
        ),
       ]
      ),
      child: Row(
        children: <Widget>[
          BarButton(
            label: 'Categorias',
            boxDecoration: BoxDecoration(
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          BarButton(
            label: 'Filtros',
            boxDecoration: BoxDecoration(
                color: Colors.white,
                border: Border(left: BorderSide(color: Colors.grey[400]))),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FilterScreen()));
            },
          ),
        ],
      ),
    );
  }
}

//offset: Offset( 0, 2),
//No caso o deslocamento foi feito somente na esquerda => 2

import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  const SectionTitle({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),//Faz o espaçamento da parte de cima e da parte de baixo
        child: Text(
          title,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
    );
  }
}

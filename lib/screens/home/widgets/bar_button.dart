import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  const BarButton({this.label, this.boxDecoration, this.onPressed});

  final BoxDecoration boxDecoration;//Decoração do botão
  final String label;//Texto do botão
  final VoidCallback onPressed;//Função chamada ao tocar no botão

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: boxDecoration,
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
      ),
    );
  }
}
// Expanded Para ocupar todo o espaço disponível
//  overflow: TextOverflow.ellipsis, se texto for muito grande corta no final
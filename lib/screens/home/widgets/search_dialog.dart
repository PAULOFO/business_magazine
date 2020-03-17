import 'package:flutter/material.dart';

class SearchDialog extends StatefulWidget {
  SearchDialog({this.currentSearch});

  final String currentSearch;

  @override
  _SearchDialogState createState() => _SearchDialogState(currentSearch);
}

class _SearchDialogState extends State<SearchDialog> {
  _SearchDialogState(String currentSearch)
      : // dois pontos faz iniciar ao mesmo tempo
        _controller = TextEditingController(text: currentSearch);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              autofocus: true, //Ao Abrir a barra de search foca no teclado
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.grey[700],
                  onPressed: () {
                    Navigator.of(context).pop();//Fecha o dialogo
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _controller.clear();//Limpa o campo de texto
                  },
                ),
              ),
              onSubmitted: (text){///Envia o texto digitado
                Navigator.of(context).pop(text);
              },
            ),
          ),
        ),
      ],
    );
  }
}

//import 'dart:html';
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {

  PasswordField({this.onSaved, this.enabled});

  final FormFieldSetter<String> onSaved;
  final bool enabled;

  @override
  Widget build(BuildContext context) {

    Widget _builder(int n, String pass){
      final int level = _calcScore(pass);//CALCULA A INTENSIDADE DA SENHA
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: n <= level ? _getColor(level) : Colors.transparent,
            border: n > level ? Border.all(color: Colors.grey) : null
          ),
        ),
      );
    }

    return FormField<String>(//<String> É A PRÓPRIA SENHA
      initialValue: '',
      onSaved: onSaved,//P SALVAR DADOS DO FORMULÁRIO
      validator: (text){
        if(text.isEmpty || _calcScore(text) < 2)
          return 'Senha inválida';
        return null;
      },
      //autovalidate: true,
      builder: (state){
        return Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              obscureText: true,//IMPEDE DE VER A SENHA
              onChanged: state.didChange,
              enabled: enabled,
            ),
            if(state.value.isNotEmpty)//SE CAMPO SENHA NÃO ESTIVER VAZIO MOSTRA AS BARRAS
            Container(
              margin: const EdgeInsets.only(top: 6),
              height: 8,
              child: Row(
                children: <Widget>[
                  _builder(0, state.value),
                  _builder(1, state.value),
                  _builder(2, state.value),
                  _builder(3, state.value),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 10,),
              child: state.value.isNotEmpty || state.hasError ? Text(//SE CAMPO NÃO ESTIVER MOSTRA MSG DE SENHA MUITO FRACA,
                //SENÃO MOSTRA Container()
                state.value.isNotEmpty ? _getText(_calcScore(state.value)) : state.errorText,//SE ESTIVER VAZIO EXIBE MSG SENHA INVÁLIDA
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: _getColor(_calcScore(state.value)),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ) : Container(),
            ),
          ],
        );
      },
    );
  }

  int _calcScore(String text) {
    int score = 0;//COMEÇA COM ZERO
    if(text.length > 11)
      score += 1;
    if(text.contains(RegExp(r'[0-9]')))//SE CONTÉM UM NÚMERO DE 0 Á 9
      score +=1;
    if(text.contains(RegExp(r'[A-Z]')))//SE CONTÉM UMA LETRA MAIÚSCULA DE A a Z
      score += 1;
    return score;
  }

  Color _getColor(int level){
    switch (level){
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.greenAccent;
      case 3:
        return Colors.green;
      default:
        return Colors.red;
    }
  } 
  
  String _getText(int level){
    switch (level){
      case 0:
        return 'Senha muito fraca';
      case 1:
        return 'Senha razoavelmente fraca';
      case 2:
        return 'Senha razoavelmente forte';
      case 3:
        return 'Senha forte';
      default:
        return '';
    }
  }
 }



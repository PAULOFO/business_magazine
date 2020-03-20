import 'package:intl/intl.dart';

String getSanitizedText(String text){
  return text.replaceAll(RegExp(r'[^\d]'), '');
}

String numToString(num number) {
  return NumberFormat('###,##0.00', 'pt-br').///SOMENTE PARA PT-BR
    format(double.parse(number.toStringAsFixed(2)));
}

String dateToString(DateTime dateTime) {
  return DateFormat('dd/MM HH:mm', 'pt-br').format(dateTime);
}

///Essa função elimina qualquer caracter que não seja uma String
///from deve ser substituído por qualqer coisa que não seja um número
///replace vai transformar em um caractere vazio
///Regex são expressões regulares, uma forma de  especificar padrões
///Dar match em qualquer coisa que não seja um número e transforma em espaço vazio
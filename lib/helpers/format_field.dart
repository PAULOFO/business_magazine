String getSanitizedText(String text){
  return text.replaceAll(RegExp(r'[^\d]'), '');
}
///Essa função elimina qualquer caracter que não seja uma String
///from deve ser substituído por qualqer coisa que não seja um número
///replace vai transformar em um caractere vazio
///Regex são expressões regulares, uma forma de  especificar padrões
///Dar match em qualquer coisa que não seja um número e transforma em espaço vazio
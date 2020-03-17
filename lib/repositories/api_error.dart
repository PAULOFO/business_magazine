import 'package:flutter/foundation.dart';

class ApiError{

  ApiError({
    @required this.code, ///@required OBRIGA O USUÁRIO A COLOCAR O CÓDIGO
    @required this.message  ///@required OBRIGA O USUÁRIO A COLOCAR A MESNGAGEM
  });

  final int code;
  final String message;


}
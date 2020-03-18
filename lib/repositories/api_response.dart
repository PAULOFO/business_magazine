import 'package:businessmagazine/repositories/api_error.dart';

class ApiResponse {

  ApiResponse.success({this.result}){
    success = true;
  }

  ApiResponse.error({this.error}){
    success = false;
  }

  bool success;///INDICARÁ SE FOI SUCESSO OU FALHA
  dynamic result;///RESULTADO DE QUALQUER TIPO
  ApiError error;///SE HOUVER ERRO NA REQUISIÇÃO, INDICA QUAL FOI O ERRO






}
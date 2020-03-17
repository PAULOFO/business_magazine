import 'package:businessmagazine/repositories/api_error.dart';

class ApiResponse {

  ApiResponse.sucess({this.result}){
    sucess = true;
  }

  ApiResponse.error({this.error}){
    sucess = false;
  }

  bool sucess;///INDICARÁ SE FOI SUCESSO OU FALHA
  dynamic result;///RESULTADO DE QUALQUER TIPO
  ApiError error;///SE HOUVER ERRO NA REQUISIÇÃO, INDICA QUAL FOI O ERRO






}
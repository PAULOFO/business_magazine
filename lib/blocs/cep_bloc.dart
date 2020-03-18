import 'package:businessmagazine/api/api_postalcode.dart';
import 'package:businessmagazine/models/address.dart';
import 'package:businessmagazine/repositories/api_response.dart';
import 'package:rxdart/rxdart.dart';

enum CepFieldState { INITIALIZING, INCOMPLETE, INVALID, VALID }

class CepBlocState {

  CepBlocState({this.cepFieldState, this.cep, this.address});

  CepFieldState cepFieldState;
  String cep;
  Address address;

}

class CapBloc {

  final BehaviorSubject<CepBlocState> _cepController = BehaviorSubject<CepBlocState>();

  void searchCep(String cep) async {
    final ApiResponse apiResponse = await getAddressFromAPI(cep);

    if(apiResponse.sucess){
      _cepController.add(
        CepBlocState(
          cepFieldState: CepFieldState.VALID,
          cep: cep,
          address: apiResponse.result,
        )
      );
    } else {
      _cepController.add(
        CepBlocState(
          cepFieldState: CepFieldState.INVALID,
          cep: cep
        )
      );
    }
  }

  void onChanged(String cep){
    cep = cep.trim().replaceAll('-','').replaceAll('-','');///trim REMOVE OS ESPAÇOS EM BRANCO
    if(cep.isEmpty || cep.length < 8){///SE CEP ESTIVER OU TAMANHO FOR MENOR Q 8, ESTÁ INCOMPLETO
      _cepController.add(
        CepBlocState(
          cepFieldState: CepFieldState.INCOMPLETE,
          cep: cep
        )
      );
    } else {
      searchCep(cep);
    }

    void dispose(){
      _cepController.close();
    }
  }
}
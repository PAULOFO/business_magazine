import 'package:businessmagazine/models/ad.dart';
import 'package:rxdart/rxdart.dart';

enum CreateState { IDLE, LOADING, DONE}//PARADO, PROCESSANDO, TERMINOU DE PROC.

class CreateBloc {

  final BehaviorSubject<CreateState> _stateController =
  BehaviorSubject<CreateState>.seeded(CreateState.IDLE);

  Stream<CreateState> get outState => _stateController.stream;

  Future<bool> saveAd(Ad ad) async {
    _stateController.add(CreateState.LOADING);//TROCA O ESTADO DA TELA PARA LOADING AO RECEBER O Ad

    //MANDAR O ad PARA O REPOSITÓRIO

    await Future.delayed(Duration(seconds: 3));

    _stateController.add(CreateState.DONE);
    return true;
  }

  void dispose (){
    _stateController.close();
  }

}
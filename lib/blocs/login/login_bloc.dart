import 'package:businessmagazine/blocs/login/button_state.dart';
import 'package:businessmagazine/blocs/login/field_state.dart';
import 'package:businessmagazine/blocs/login/login-bloc_state.dart';
import 'package:businessmagazine/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';
//mport 'dart:html';

class LoginBloc with LoginValidator {

  final BehaviorSubject<LoginBlocState> _stateController =
      BehaviorSubject<LoginBlocState>.seeded(LoginBlocState(LoginState.IDLE));
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Function(String) get changedEmail => _emailController.sink.add;
  Function(String) get changedPassword => _passwordController.sink.add;

  Stream<LoginBlocState> get outState => _stateController.stream;

  Stream<FieldState> get outEmail => Rx.combineLatest2(
      _emailController.stream.transform(emailValidator), outState, (a, b){
      a.enabled = b.state != LoginState.LOADING;
      return a;
  });
      
  Stream<FieldState> get outPassword => Rx.combineLatest2(
      _passwordController.stream.transform(passwordValidator), outState, (a, b){
      a.enabled = b.state != LoginState.LOADING;
      return a;
  });

  //Compara e Combina o último dado passado por cada uma das 3 streams
  Stream<ButtonState> get outLoginButton => Rx.combineLatest3(
      outEmail, outPassword, outState, (a, b, c){
        //a->outEmail, b->outPassword, c-> outState
        return ButtonState(
          loading: c.state == LoginState.LOADING,
          enabled: a.error == null && b.error == null
              && c.state != LoginState.LOADING
        );
      }
  );

  Future<bool> loginWithEmail() async {//Para realizar Login com E-mail
    _stateController.add(LoginBlocState(LoginState.LOADING));//Informa a tela que está fazendo login

    await Future.delayed(Duration(seconds: 3));

    _stateController.add(LoginBlocState(LoginState.DONE));
    return true;
  }

  Future<bool> loginWithFacebook() async {
    _stateController.add(LoginBlocState(LoginState.LOADING_FACE));//Informa a tela que está fazendo login

    await Future.delayed(Duration(seconds: 3));

    _stateController.add(LoginBlocState(LoginState.DONE));
    return true;
  }


  void dispose(){
    _stateController.close();
    _emailController.close();
    _passwordController.close();
  }
}


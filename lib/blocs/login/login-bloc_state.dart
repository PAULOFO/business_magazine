enum LoginState { IDLE, LOADING, LOADING_FACE, ERROR, DONE  }
//enum-> enumerador é um conjunto de constantes

class LoginBlocState {
  LoginBlocState(this.state, {this.errorMessage});

  LoginState state;
  String errorMessage;
}
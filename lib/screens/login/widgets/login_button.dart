import 'package:businessmagazine/blocs/login/button_state.dart';
import 'package:businessmagazine/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
//import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginButton extends StatelessWidget {

  const LoginButton(this.loginBloc);

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      height: 50,
      child: StreamBuilder<ButtonState>(
        stream: loginBloc.outLoginButton,
        initialData: ButtonState(enabled: false, loading: false),
        builder: (context, snapshot) {
          return RaisedButton(
            color: Colors.pink,
            disabledColor: Colors.pink.withAlpha(150),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
                ),
            onPressed: snapshot.data.enabled ? () async {//Se habilitado passa a função
              final bool sucess = await loginBloc.loginWithEmail();
              if(sucess)
                Navigator.of(context).pop();//Se login com sucesso fecha a tela
            } : null,
            child: snapshot.data.loading ? //Se estiver carregando mostra CircularProgressIndicator
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
                :
            Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}

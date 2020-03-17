import 'package:businessmagazine/blocs/login/field_state.dart';
import 'package:businessmagazine/blocs/login/login_bloc.dart';
import 'package:businessmagazine/screens/login/widgets/facebook_button.dart';
import 'package:businessmagazine/screens/login/widgets/login_button.dart';
import 'package:businessmagazine/screens/login/widgets/or_divider.dart';
import 'package:businessmagazine/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
//import 'dart:html';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginBloc _loginBloc = LoginBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Entrar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //stretch faz q todos os campos na coluna ocupem a maior largura possível
            children: <Widget>[
              FacebookButton(_loginBloc),
              OrDivider(),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 11),
                child: Text(
                  'Acessar com E-mail:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3, bottom: 14),
                child: Text(
                  'E-mail:',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              StreamBuilder<FieldState>(
                initialData: FieldState(),
                stream: _loginBloc.outEmail,
                  builder: (context, snapshot){
                    return TextField(
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,//Para não ficar auto-corrigindo
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorText: snapshot.data.error,
                      ),
                      onChanged: _loginBloc.changedEmail,
                      enabled: snapshot.data.enabled,
                    );
                  },
               ),
              Padding(
                padding: EdgeInsets.only(left: 3, bottom: 4, top: 26,),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Senha:',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: (){
                        //Navigator.of(context).push(
                            //MaterialPageRoute(builder: (context)=> RecoveryScreen()));
                      },
                    ),
                  ],
                )
              ),
              StreamBuilder<FieldState>(
                stream: _loginBloc.outPassword,
                initialData: FieldState(),
                builder: (context, snapshot){
                  return TextField(
                    autocorrect: false,//Para não ficar auto-corrigindo
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: snapshot.data.error,
                    ),
                    onChanged: _loginBloc.changedPassword,//Passa o texto ao ser modificado
                    enabled: snapshot.data.enabled,//Habilita ou desabilita o campo atual
                  );
                },
              ),
              LoginButton(_loginBloc),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Não tem uma conta?',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 7,),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                            'Cadastre-se',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


///Stateful para não perder o conteúdo dos campos,
///para manter os dados dentro do campo
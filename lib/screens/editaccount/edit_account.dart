import 'package:brasil_fields/brasil_fields.dart';
import 'package:businessmagazine/models/user.dart';
import 'package:businessmagazine/screens/account/widgets/user_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {

  final User _user = User(name: 'Paulo Oliveira', phone: '99900-2204');

  @override
  Widget build(BuildContext context) {
    InputDecoration _buildDecoration(String label) {
      return InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Editar Conta'),
      ),
      body: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            UserTypeWidget(
              initialValue: _user.userType,
              onSaved: (userType){

              },
            ),
            TextFormField(
              initialValue: _user.name,//Mostra o nome atual
              decoration: _buildDecoration('Nome*'),
              validator: (name) {
                if (name.length < 7)
                  return 'Nome inválido';
                return null;
              },
              onSaved: (name) {

              },
            ),
            TextFormField(
              initialValue: _user.phone,//Mostra o tel atual
              decoration: _buildDecoration('Telefone*'),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(digito_9: true),
              ],
              validator: (phone) {
                if (phone.length < 15)
                  return 'Telefone Inválido';
                return null;
              },
              onSaved: (phone) {

              },
            ),
            TextFormField(
              obscureText: true,
              decoration: _buildDecoration('Nova Senha*'),
              validator: (pass) {
                if (pass.isEmpty)
                  return null;
                if (pass.length < 10)
                  return 'Senha muito curta';
                return null;
              },
              autovalidate: true,
            ),
            TextFormField(
              obscureText: true,
              decoration: _buildDecoration('Repita nova Senha*'),
              validator: (pass) {
                if (pass.length < 10)
                  return null;
                if (pass.length < 10)
                  return 'Senha muito curta';
                return null;
              },
              autovalidate: true,
            ),
          ] ,
      ),
    );
  }
}


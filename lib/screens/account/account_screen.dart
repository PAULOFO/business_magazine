import 'package:businessmagazine/common/custom_drawer/custom_drawer.dart';
import 'package:businessmagazine/screens/editaccount/edit_account.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Minha conta'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> EditAccountScreen())
                );
              }, icon: Icon(Icons.edit,color: Colors.white,),
                 label: Text(
                     'EDITAR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                 ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: Text(
              'Paulo Oliveira',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Meus anúncios',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Favoritos',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

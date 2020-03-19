import 'package:brasil_fields/brasil_fields.dart';
import 'package:businessmagazine/blocs/create_bloc.dart';
import 'package:businessmagazine/blocs/drawer_bloc.dart';
import 'package:businessmagazine/common/custom_drawer/cep_field.dart';
import 'package:businessmagazine/common/custom_drawer/custom_drawer.dart';
import 'package:businessmagazine/models/ad.dart';
import 'package:businessmagazine/screens/create/widgets/hide_phone_widget.dart';
import 'package:businessmagazine/screens/create/widgets/images_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CreateBloc _createBloc;

  Ad ad = Ad();

  @override
  void initState() {
    super.initState();
    _createBloc = CreateBloc();
  }

  @override
  void dispose() {
    _createBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Inserir Anúncio'),
      ),
      drawer: CustomDrawer(),
      body: Form(///Form é o padrão de Formulários
        key: _formKey,
        child: ListView(
          children: <Widget>[
            ImagesField(
              onSaved: (images){ ///IMAGENS
                ad.images = images;
              },
              initialValue: [],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Título *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              validator: (text) {
                if (text.isEmpty) return 'Campo Obrigatório';
                return null;
              },
              onSaved: (t) { ///TÍTULO
                ad.title = t;
              },
            ),
            TextFormField(
              maxLines: null,///Quantas linhas quiser preencher
              decoration: InputDecoration(
                labelText: 'Descrição *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              validator: (text) {
                if (text.trim().isEmpty) return 'Campo Obrigatório';
                if (text.trim().length < 10)
                  return 'Descrição muito curta';
                return null;
              },
              onSaved: (d) { ///DESCRIÇÃO
                ad.description = d;
              },
            ),
            CepField(
              decoration: InputDecoration(
                labelText: 'CEP*',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
               ),
                onSaved: (a) { ///CEP ENDEREÇO
                  ad.address = a;
                },
              ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Preço *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true),
              ],
              validator: (text) {
                if (text.isEmpty) return 'Campo Obrigatório';
                //if (text.trim().isEmpty) return 'Campo Obrigatório';
                if (int.tryParse(getSanitizedText(text)) == null)
                  return 'Utilize valores válidos';
                return null;
              },
              onSaved: (p) { ///PREÇO
                ad.price = int.parse(getSanitizedText(p)) / 100;
              },
            ),
            HidePhoneWidget(
              onSaved: (h){
                ad.hidePhone = h;
              },
              initialValue: false,
            ),
            Container(
              height: 50,
              child: RaisedButton(
                color: Colors.pink,
                child: Text(
                  'Enviar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();

                    final bool sucess = await _createBloc.saveAd(ad);

                    if(sucess){
                      Provider.of<DrawerBloc>(context).setPage(0);
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
  String getSanitizedText(String text) {
    return text.replaceAll(RegExp(r'[^\d]'), '');
  }
}

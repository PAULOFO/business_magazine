import 'package:businessmagazine/models/filter.dart';
import 'package:businessmagazine/screens/filter/widgets/animated_button.dart';
import 'package:businessmagazine/screens/filter/widgets/order_by_field.dart';
import 'package:businessmagazine/screens/filter/widgets/price_range_field.dart';
import 'package:businessmagazine/screens/filter/widgets/section_title.dart';
import 'package:businessmagazine/screens/filter/widgets/vendor_type_field.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  Filter _filter = Filter(
    maxPrice: 100,
    minPrice: 10,
    vendorType: VENDOR_TYPE_PARTICULAR,
    orderBy: OrderBy.PRICE,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF692CD5),
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Filtrar busca'),
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),//Para dar distância no topo, lateral e embaixo
              children: <Widget>[
                const SectionTitle(title: 'Ordenar por'),
                OrderByField(
                    initialValue: _filter.orderBy,
                    onSaved: (v) {
                      _filter.orderBy = v;
                    }
                ),
                const SectionTitle(title: 'Preço (R\$)'),
                PriceRangeField(
                  filter: _filter,
                ),
                const SectionTitle(title: 'Tipo de anunciante'),
                VendorTypeField(
                  initialValue: _filter.vendorType,
                  onSaved: (v) {
                    _filter.vendorType = v;
                  },
                ),
                const SizedBox(height: 100,),
              ],
            ),
          ),
          AnimatedButton(
            scrollController: _scrollController,
            onTap: (){
             if(_formKey.currentState.validate()){//Se todos os formulários retornarem nulo ele válida todos os campos
                _formKey.currentState.save();//e então salva

               if(_filter.maxPrice != null && _filter.minPrice != null){//Se os dois filtros forem difrentes de nulo
                 if(_filter.minPrice > _filter.maxPrice){//e o filtro min for maior que o filtro max
                  _scaffoldKey.currentState.showSnackBar(//aparece a snackBar informando o erro
                    SnackBar(
                        content: const Text(
                          'Faixa de preço inválida!'
                        ),
                      backgroundColor: Colors.pink,
                    ),
                  );
                  return;
                 }
               }
               //SALVAR TUDO E PEESQUISAR ANÚNCIOS!!!
             }
            },
          ),
        ],
      ),
    );
  }
}

///Stateful mantém o Estado interno
///Stack p/ que o botão fique acima do conteúdo da tela
///Form -> Tudo na tela será um componente do formulário, então se
///declara uma GlobalKey e se inicia com GlobalKey<FormState>();


///Para habilitar várias Flags ao mesmo tempo basta adicionar um | OU Lógico
///para ir habilitando todas elas
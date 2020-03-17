import 'package:brasil_fields/brasil_fields.dart';
import 'package:businessmagazine/helpers/format_field.dart';
import 'package:businessmagazine/models/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceRangeField extends StatelessWidget {

  PriceRangeField({this.filter});

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Min',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,//Impede que seja colado qualquer texto
              RealInputFormatter(centavos: false),//Formata no padrão de Reais e não permite centavos
            ],
            initialValue: filter.minPrice ?.toString(),//Se não for nulo transforma em String e coloca no campo
            onSaved: (s){//Se o valor passado for vazio, pega o filtro e fala que o preço minímo é nulo
              if(s.isEmpty)
                filter.minPrice = null;
              else
                filter.minPrice = int.tryParse(getSanitizedText(s));
            },
            validator: (s){//Para validar verificar se é um número válido
              if(s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null)//Se esse texto não for vazio e o texto for igual a null
                return 'Utilize valores válidos';
              return null;//Caso contrário retorna indicando que é um campo válido
            },
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Max',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,//Impede que seja colado qualquer texto
              RealInputFormatter(centavos: false),//Formata no padrão de Reais e não permite centavos
            ],
            initialValue: filter.maxPrice ?.toString(),
            onSaved: (s){
              if(s.isEmpty)
                filter.maxPrice = null;
              else
                filter.maxPrice = int.tryParse(getSanitizedText(s));
            },
            validator: (s){//Para validar verificar se é um número válido
              if(s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null)//Se esse texto não for vazio e o texto for igual a null
                return 'Utilize valores válidos';
              return null;//Caso contrário retorna indicando que é um campo válido
            },
          ),
        ),
      ],
    );
  }
}

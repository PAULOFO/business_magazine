import 'package:businessmagazine/models/ad.dart';
import 'package:flutter/material.dart';

class DescriptionPanel extends StatefulWidget {

  const DescriptionPanel(this.ad);

  final Ad ad;

  @override
  _DescriptionPanelState createState() => _DescriptionPanelState();
}

class _DescriptionPanelState extends State<DescriptionPanel> {

  Ad get ad => widget.ad;


  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Descrição',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            ad.description,
            maxLines: open ? 10 : 2,///Se estiver aberto não números de linha máximo, se estiver fechado máximo de 2 linhas
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        //if(ad.description.length < 100) const SizedBox( ///Pra sempre exibir o botão
        if(open || ad.description.length < 100) const SizedBox(
          height: 18,///Se a descrição estiver aberta exibe SizedBox, Senão exibe FlatButton
        ) else Align(
          alignment: Alignment.centerLeft,
          child: FlatButton(
            padding: EdgeInsets.zero,
            child: Text(
              'Ver descrição completa',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.pink,//AppColors.mainPurple
              ),
            ),
            onPressed: (){
              setState(() {
                open = true;
                //open = !open; ///open igual a not open
              });
            },
          ),
        )
      ],
    );
  }
}

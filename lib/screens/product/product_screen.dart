import 'package:businessmagazine/models/ad.dart';
import 'package:businessmagazine/screens/product/widgets/main_panel.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {

  ProductScreen(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anúncio'),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280,
            child: Carousel(
              images: ad.images.map((f){
                return FileImage(f);
              }).toList(),
              dotSize: 4,///Tamanho das bolinhas
              dotSpacing: 15,///Espaço entre as bolinhas
              dotBgColor: Colors.transparent,///Cor por trás das bolinhas
              dotColor: Colors.pink,///Cor da bolinhas
              autoplay: false,///true->Faz o Carousel se mover automaticamente
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MainPanel(ad),
//                Divider(),
//                DescriptionPanel(ad),
//                Divider(),
//                LocationPanel(ad),
//                Divider(),
//                UserPanel(ad),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

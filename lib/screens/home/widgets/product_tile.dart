import 'package:businessmagazine/models/ad.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductTile extends StatelessWidget {
  ProductTile(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: () {

      },
      child: Container(
        height: 135,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Card(
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 135,
                width: 127,
                child: Image.file(ad.images[0], fit: BoxFit.cover,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ad.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'R\$${numToString(ad.price)}',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${ad.address.district}, ${ad.address.city}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String numToString(num number) {
    return NumberFormat('###,##0.00', 'pt-br').///SOMENTE PARA PT-BR
    format(double.parse(number.toStringAsFixed(2)));
  }
}

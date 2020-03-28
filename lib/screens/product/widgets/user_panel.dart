import 'package:businessmagazine/models/ad.dart';
import 'package:flutter/material.dart';

class UserPanel extends StatelessWidget {
  const UserPanel(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
          child: Text(
            'Anunciante',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Paulo',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                 'Na OLX desde hoje',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}

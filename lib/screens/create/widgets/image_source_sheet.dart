import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {

  ImageSourceSheet(this.onImageSelected);

  final Function(File) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: (){},
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                child: Text('Câmera'),
                onPressed: () async {
                  final File image =
                    await ImagePicker.pickImage(source: ImageSource.camera);
                  onImageSelected(image);
                },
              ),
              FlatButton(
                child: Text('Galeria'),
                onPressed: () async {
                  final File image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                  onImageSelected(image);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

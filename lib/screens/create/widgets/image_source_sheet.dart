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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: ()async{
                        final File image =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                        onImageSelected(image);
                      }, icon: Icon(Icons.camera_enhance, color: Colors.grey,),
                         label: Text(
                             'Foto',
                           style: TextStyle(
                             color: Colors.grey,
                           ),
                         ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        final File image =
                        await ImagePicker.pickVideo(source: ImageSource.camera);
                        onImageSelected(image);
                      }, icon: Icon(Icons.videocam, color: Colors.grey,),
                         label: Text(
                             'Vídeo',
                           style: TextStyle(
                             color: Colors.grey,
                           ),
                         ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      final File image =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                      onImageSelected(image);
                    }, icon: Icon(Icons.image, color: Colors.grey,),
                    label: Text(
                      'Galeria',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

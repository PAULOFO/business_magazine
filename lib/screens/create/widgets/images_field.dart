import 'package:businessmagazine/screens/create/widgets/image_source_sheet.dart';
import 'package:flutter/material.dart';

class ImagesField extends StatelessWidget {

  ImagesField({this.onSaved, this.initialValue});

  final FormFieldSetter<List> onSaved;
  final List initialValue;

  @override
  Widget build(BuildContext context) {
    return FormField<List>(
      initialValue: initialValue,
      onSaved: onSaved,
      validator: (images){
        if(images.isEmpty)//Se não houver imagem retorn 'Campo Obrigatório
          return 'Campo Obrigatório';//Senão retorna nulo
        return null;
      },
      builder: (state){
        return Column(
          children: <Widget>[
            Container(
              color: Colors.grey,
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.value.length + 1,///+ 1 Esse item é o botão de adicionar images
                itemBuilder: (context, index) {
                  if (index == state.value.length)
                    return GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => ImageSourceSheet(
                                (image) {
                                  if(image != null)//Se diferente de null adiciona imagem
                                  state.didChange(state.value..add(image));
                                  ///.. dois pontos serve p/ retornar state.value
                                  ///depois de adicionar as images
                                  Navigator.of(context).pop();///Para sumir a barrinha que aparece embaixo
                                }
                            ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 52,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.camera_alt,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                '+ Inserir',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    return GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.file(state.value[index]),
                                FlatButton(
                                  child: const Text('Excluir'),
                                  textColor: Colors.red,
                                  onPressed: (){
                                    state.didChange(state.value..removeAt(index));
                                    Navigator.of(context).pop();///Fecha o Dialog
                                  },
                                ),
                              ],
                            )
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundImage: FileImage(state.value[index]),
                        ),
                      ),
                    );
                },
              ),
            ),
            if(state.hasError)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  state.errorText,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              )
          ],
        );
      },
    );
  }
}

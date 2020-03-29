import 'package:businessmagazine/models/user.dart';
import 'package:flutter/material.dart';

class UserTypeWidget extends StatelessWidget {
  const UserTypeWidget({this.initialValue, this.onSaved});

  final UserType initialValue;
  final FormFieldSetter<UserType> onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FormField(
          initialValue: initialValue,
          onSaved: onSaved,
          builder: (state){
            return Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      'Particular',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                        value: UserType.PARTICULAR,
                        groupValue: state.value,
                        onChanged: state.didChange,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      'Professional',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: UserType.PROFESSIONAL,
                      groupValue: state.value,
                      onChanged: state.didChange,
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
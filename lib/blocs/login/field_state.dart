class FieldState { //Objeto p/ controlar error e enabled
  FieldState({this.error, this.enabled=true});

  String error;
  bool enabled;
}
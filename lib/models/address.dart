class Address {

  Address({
    this.place,
    this.district,
    this.city,
    this.postalCode,
    this.federativeUnit,
  });

  String place; ///RUA, AVENIDA, TRAVESSA
  String district; ///BAIRRO
  String city; ///CIDADE
  String postalCode; ///CEP
  String federativeUnit; ///UNIDADE FEDERATIVA(ESTADO)

  @override
  String toString() {
    return '$place, $district, $city, $postalCode, $federativeUnit';
  }


}
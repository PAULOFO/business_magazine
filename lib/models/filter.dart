enum OrderBy {DATE, PRICE}///Declaração do enumerador

//Bit Flags
const VENDOR_TYPE_PARTICULAR = 1 << 0;//0001
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;//0010

class Filter {

  Filter({
    this.search,
    this.orderBy = OrderBy.DATE,//DATE já estará selecionado ao abrir o Filtro
    this.minPrice,
    this.maxPrice,
    this.vendorType = VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL,//Já estarão habilitados
  });

  String search;
  OrderBy orderBy;
  int minPrice;
  int maxPrice;
  int vendorType;
}

///VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL //0011
///Númeração Binária
///0001 = Número 1
///0010 = Número 2
///0011 = Número 3
/// | Barra vertical gera o valor 0011, fazendo o OU Lógico, pega cada um
/// dos Bits e faz um OU com cada Bit correspondente
/// Conversão Binária, Rotação de Bit
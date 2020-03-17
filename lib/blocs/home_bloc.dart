import 'package:rxdart/rxdart.dart';

class HomeBloc {

    final BehaviorSubject<String> _searchController = BehaviorSubject<String>();
    //BehaviorSubject->É o controle responsável por enviar o texto do Search p/ todos os
    //locais onde o texto é necessário
    Stream<String> get outSearch => _searchController.stream;
    //outSearch->Faz com que seja capaz de saber qual o texto que estamos pesquisando de qualquer local
    void setSearch(String search){//Método q vai receber a nova search
      _searchController.add(search);
    }

    void dispose(){
      _searchController.close();
    }
}
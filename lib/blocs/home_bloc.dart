import 'package:businessmagazine/models/ad.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {

    final BehaviorSubject<String> _searchController = BehaviorSubject<String>();
    final BehaviorSubject<List<Ad>> _adController = BehaviorSubject<List<Ad>>.seeded([]);///ADICIONA ANÚNCIOS NA LISTA
    //BehaviorSubject->É o controle responsável por enviar o texto do Search p/ todos os
    //locais onde o texto é necessário
    Stream<String> get outSearch => _searchController.stream;
    Stream<List<Ad>> get outAd => _adController.stream;

    void addAd(Ad ad){
      _adController.add(_adController.value..add(ad));
    }

    //outSearch->Faz com que seja capaz de saber qual o texto que estamos pesquisando de qualquer local
    void setSearch(String search){//Método q vai receber a nova search
      _searchController.add(search);
    }

    void dispose(){
      _searchController.close();
      _adController.close();
    }
}
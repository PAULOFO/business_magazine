import 'package:rxdart/rxdart.dart';

class DrawerBloc {

  final BehaviorSubject<int> _pageController = BehaviorSubject<int>.seeded(0);
  //BehaviorSubject Armazena o último valor que passou pela String
  //int pq armazena o número da página
  //seeded(0) zero pq inicia na página 0

  Stream<int> get outPage => _pageController.stream;//Obtém a página atual sempre que for modificada

  int _page = 0;//Função auxiliar p/ função setPage

  void setPage(int page){//Função p/ receber a página que queremos ir
    if(page == _page)//Se clicarmos p ir na mesma página que já estamos
      return;
    _page = page;//Salva a página atual
    _pageController.add(page);
  }

  void dispose() {
    _pageController.close();//Fecha o stream controller
  }
}

/*Todas as vezes que houver alteração no outPage tem que chamar o _pageController
na BaseScreen para trocar a tela
e para acessar de dentro do StatefulWidget deve-se usar a funçao didChangeDependencies
   @override
   void didChangeDependencies() {
    super.didChangeDependencies();
jyjft
    }
Deve-se declarar o DrawerBloc _drawerBloc e

final DrawerBloc drawerBloc = Provider

Porém qdo der um hotreload ou restart o didChangeDependecies será chamado de novo
então se a referência para o DrawerBloc mudar tem que mudar o DrawerBloc de cima também
 */
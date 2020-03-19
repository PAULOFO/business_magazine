import 'package:businessmagazine/blocs/home_bloc.dart';
import 'package:businessmagazine/common/custom_drawer/custom_drawer.dart';
import 'package:businessmagazine/models/ad.dart';
import 'package:businessmagazine/screens/home/widgets/search_dialog.dart';
import 'package:businessmagazine/screens/home/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeBloc _homeBloc;

  @override
  void didChangeDependencies() {
    ///Chamado para obter o bloc usando uma classe usando Stateful
    super.didChangeDependencies();

    final HomeBloc homeBloc = Provider.of<HomeBloc>(context);
    if(homeBloc != _homeBloc)//Se HomeBloc não é mais o HomeBloc passado
      _homeBloc = homeBloc;//_homeBloc será igual a homeBloc
  }

  @override
  Widget build(BuildContext context) {

    _openSearch(String currentSearch) async {
      final String search = await showDialog(context: context,
            builder: (context) => SearchDialog(currentSearch: currentSearch),
        );
        if(search != null)//Para não enviar null para o Bloc ao clicar na seta
          _homeBloc.setSearch(search);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: StreamBuilder<String>(
          stream: _homeBloc.outSearch,
          initialData: "",
          builder: (context, snapshot){
            if(snapshot.data.isEmpty)
              return Container();
            else
              return GestureDetector(
                onTap: () => _openSearch(snapshot.data),
                child: LayoutBuilder(
                  builder: (context, constraints){
                    return Container(
                      child: Text(snapshot.data),
                      width: constraints.biggest.width,//Faz a maior largura possível
                    );
                  },
                ),
              );
          },

        ),
        actions: <Widget>[
          StreamBuilder<String>(
              stream: _homeBloc.outSearch,
              initialData: "",
              builder: (context, snapshot){
                if(snapshot.data.isEmpty)
                  return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){
                      _openSearch("");
                    },
                  );
                else
                  return IconButton(
                    icon: Icon(Icons.close),
                    onPressed: (){
                      _homeBloc.setSearch("");
                    },
                  );
              },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          TopBar(),
          Expanded(
            child: StreamBuilder<List<Ad>>(
              stream: _homeBloc.outAd,
              builder: (context, snapshot){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(snapshot.data[index].title),
                    );
                  },
                );
              },
            )
          )
        ],
      ),
    );
  }
}


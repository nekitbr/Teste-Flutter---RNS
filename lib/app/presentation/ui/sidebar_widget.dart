import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_salcisne/app/presentation/bloc/sidebar/sidebar_bloc.dart';
import 'package:teste_salcisne/app/presentation/bloc/sidebar/sidebar_event.dart';
import 'package:teste_salcisne/app/presentation/bloc/sidebar/sidebar_state.dart';
import 'package:teste_salcisne/app/presentation/ui/estoques/lista_estoques_page.dart';
import 'package:teste_salcisne/app/presentation/ui/home/home_page.dart';
import 'package:teste_salcisne/app/presentation/ui/produtos/lista_produtos_page.dart';

class SidebarWidget extends StatelessWidget  {
  final Function(Widget, String) navigateTo;

  const SidebarWidget({Key key, @required this.navigateTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SidebarBloc(),
      child: BlocBuilder<SidebarBloc, SidebarState> (
        builder: (context, state) {
          return Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountEmail: Text("josedallasta9@gmail.com"),
                  accountName: Text("José Dall'Asta"),
                  currentAccountPicture: InkWell(
                    onTap: () {
                      BlocProvider.of<SidebarBloc>(context).add(SidebarSelectItemEvent(0));
                      BlocProvider.of<SidebarBloc>(context).add(SidebarCloseEvent());
                      navigateTo(HomePage(), "");
                    },
                    child: CircleAvatar(child: Icon(Icons.person))
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.view_list_rounded),
                  title: Text("Produtos"),
                  selected: state.selectedIndex == 0,
                  onTap: () {
                    BlocProvider.of<SidebarBloc>(context).add(SidebarSelectItemEvent(0));
                    BlocProvider.of<SidebarBloc>(context).add(SidebarCloseEvent());
                    navigateTo(ListaProdutosPage(), "Lista de Produtos");
                  }
                ),
                ListTile(
                  leading: Icon(Icons.warehouse_outlined),
                  title: Text("Produtos em Estoque"),
                  selected: state.selectedIndex == 1,
                  onTap: () {
                    BlocProvider.of<SidebarBloc>(context).add(SidebarSelectItemEvent(1));
                    BlocProvider.of<SidebarBloc>(context).add(SidebarCloseEvent());
                    navigateTo(ListaEstoquesPage(), "Lista de Estoques");
                  }
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
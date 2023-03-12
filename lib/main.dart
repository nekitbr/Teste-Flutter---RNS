import 'package:flutter/material.dart';
import 'package:teste_salcisne/app/presentation/ui/home/home_page.dart';
import 'package:teste_salcisne/app/presentation/ui/sidebar_widget.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Widget _selectedMenuPage = HomePage();
  String _pageTitle = "";

  void _onItemSelected(Widget page, String pageTitle) {
    setState(() {
      _selectedMenuPage = page;
      _pageTitle = pageTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(_pageTitle)),
        drawer: SidebarWidget(navigateTo: _onItemSelected),
        body: _selectedMenuPage,
      ),
    );
  }
}

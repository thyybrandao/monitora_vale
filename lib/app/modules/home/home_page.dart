import 'package:covidvale/app/modules/home/pages/saude/saude_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'pages/decretos/decretos_page.dart';
import 'pages/municipio/municipio_page.dart';
import 'pages/telefones/telefones_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

  
  
  int indice = 0;

  List<Widget> telas = [
    SaudePage(),
    MunicipioPage(),
    DecretosPage(),
    TelefonesPage()
  ];

  var notificacao = HomeController();

  @override
  void initState() {
    super.initState();
    notificacao.receberNotificacao();
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indice,
          onTap: (index) {
            setState(() {
              indice = index;
              print("INDICE: $indice");            
            });
          },
          type: BottomNavigationBarType.shifting,
          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.redAccent,
                icon: Icon(Icons.local_hospital),
                title: Text("Saúde")),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(Icons.location_city),
                title: Text("Municipio")),
            BottomNavigationBarItem(
                backgroundColor: Colors.blueAccent,
                icon: Icon(Icons.insert_drive_file),
                title: Text("Decretos")),
            BottomNavigationBarItem(
                backgroundColor: Colors.purple,
                icon: Icon(Icons.phone),
                title: Text("Telefones"))
          ],
        ),
        body: telas[indice],
      ),
    );
  }
}

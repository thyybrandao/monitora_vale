import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidvale/app/app_module.dart';
import 'package:covidvale/app/modules/home/home_controller.dart';
import 'package:covidvale/app/modules/home/pages/saude/saude_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'widgets/emblema.widget.dart';
import 'widgets/tabela.widget.dart';

class MunicipioPage extends StatefulWidget {
  final String title;
  const MunicipioPage({Key key, this.title = "Municipio"}) : super(key: key);

  @override
  _MunicipioPageState createState() => _MunicipioPageState();
}

class _MunicipioPageState extends State<MunicipioPage> {

  Firestore db = Firestore.instance;
  final getIt = GetIt.I.get<SaudeController>();
  SaudeController controller = SaudeController();


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getIt.titulocidade),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
          child: StreamBuilder(
        stream: db.collection("cidades").document(getIt.cidade).snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text("Carregando")
                  
                ],
              ),
              
              ],
              )
                ],
              );

            case ConnectionState.active:
            case ConnectionState.done:

          

              //QuerySnapshot querySnapshot = snapshot.data;
              DocumentSnapshot documentSnapshot = snapshot.data;
              //List<DocumentSnapshot> resultado = querySnapshot.documents.toList();
              Map<String, dynamic> dados = documentSnapshot.data;

              if (snapshot.hasError) {
                return Text("Erro ao carregar dados");
              } else {
                
                print("MUNUCIPIO 1" + getIt.cidade);
                // print("MUNUCIPIO 2" + saudeController.cidade);
                // print("MUNUCIPIO 3" + teste.cidade);

                //   Tabela(
                //     populacao: dados["populacao"].toString(),
                //     postosSaude: "wewewe",
                //     hospitais: dados["hospitais"].toString(),
                //     leitosVagos: dados["leitos_disponivel"].toString(),
                //     totalLeitos: dados["total_leitos"].toString(),
                //     upa: dados["upa"].toString(),
                // );

                return SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 0),
                            child: Emblema(
                              municipio: getIt.cidade,
                              tamanho: 6,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, top: 0, right: 0, bottom: 0),
                        child: Tabela(
                          populacao: dados["populacao"].toString(),
                          postosSaude: dados["postos_saude"].toString(),
                          hospitais: dados["hospitais"].toString(),
                          leitosVagos: dados["leitos_disponivel"].toString(),
                          totalLeitos: dados["total_leitos"].toString(),
                          upa: dados["upa"].toString(),

                        ),
                      )
                    ],
                  ),
                );
              }

              break;
          }

          return Text("");
        },
      )),
    );
  }
}

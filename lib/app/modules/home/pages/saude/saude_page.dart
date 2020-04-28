import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'saude_controller.dart';
import 'widgets/bloco_widget.dart';

class SaudePage extends StatefulWidget {
  final String title;
  const SaudePage({Key key, this.title = "Saude"}) : super(key: key);

  @override
  _SaudePageState createState() => _SaudePageState();
}

class _SaudePageState extends State<SaudePage> {

  final controller = SaudeController();
  final getIt = GetIt.I.get<SaudeController>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            return DropdownButton(
                
                icon: Icon(
                  Icons.pin_drop,
                  color: Colors.white70,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("Registro-SP"),
                    value: "registro",
                  ),
                  DropdownMenuItem(
                    child: Text("Pariquera-Açu/SP"),
                    value: "pariquera",
                  ),
                  DropdownMenuItem(
                    child: Text("Sete Barras-SP"),
                    value: "setebarras",
                  ),
                  DropdownMenuItem(
                    child: Text("Cajati-SP"),
                    value: "cajati",
                  ),
                  DropdownMenuItem(
                    child: Text("Jacupiranga-SP"),
                    value: "jacupiranga",
                  ),
                  DropdownMenuItem(
                    child: Text("Miracatu-SP"),
                    value: "miracatu",
                  ),
                  DropdownMenuItem(
                    child: Text("Eldorado-SP"),
                    value: "eldorado",
                  ),
                  DropdownMenuItem(
                    child: Text("Ilha Comprida-SP"),
                    value: "ilhacomprida",
                  ),
                  DropdownMenuItem(
                    child: Text("Iguape-SP"),
                    value: "iguape",
                  ),
                  DropdownMenuItem(
                    child: Text("Cananéia-SP"),
                    value: "cananeia",
                  )
                ],
                onChanged: (value) {

                  controller.mudaCidade(value);
                  
                  
                  getIt.titulocidade = controller.mudatitulo(value);
                  getIt.cidade = controller.cidade;

                },

                value: getIt.cidade,

                );
          }
          ),

          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body:Observer(builder: (_) {
            return StreamBuilder(
              stream: controller.pegaCidade(getIt.cidade),
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

                      print("PAGE1 " + controller.cidade);
                      print("TITULO " + getIt.titulocidade);
                      //print(dados["hospitais"].toString());

                      //   Tabela(
                      //     populacao: dados["populacao"].toString(),
                      //     postosSaude: "wewewe",
                      //     hospitais: dados["hospitais"].toString(),
                      //     leitosVagos: dados["leitos_disponivel"].toString(),
                      //     totalLeitos: dados["total_leitos"].toString(),
                      //     upa: dados["upa"].toString(),
                      // );

                      return SingleChildScrollView(
                        child: Column(children: <Widget>[
                          BlocoWidget(
                            titulo: "SUSPEITOS",
                            total: dados["suspeito_total"].toString(),
                            novos: dados["suspeito_novos"].toString(),
                            gradient: [Colors.yellow[300], Colors.amber],
                          ),
                          BlocoWidget(
                            titulo: "CONFIRMADOS",
                            total: dados["confirmados_total"].toString(),
                            novos: dados["confirmados_novos"].toString(),
                            gradient: [Colors.red[300], Colors.red[700]],
                          ),
                          BlocoWidget(
                            titulo: "RECUPERADOS",
                            total: dados["recuperados_total"].toString(),
                            novos: dados["recuperados_novos"].toString(),
                            gradient: [Colors.green[300], Colors.green[700]],
                          ),
                          BlocoWidget(
                            titulo: "ÓBITOS",
                            total: dados["obito_total"].toString(),
                            novos: dados["obito_novo"].toString(),
                            gradient: [Colors.black54, Colors.black87],
                          ),
                        ]),
                      );
                    }

                    break;
                }

                return Text("");
              },
            );
          })
        
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidvale/app/modules/home/pages/saude/saude_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class TelefonesPage extends StatefulWidget {
  final String title;
  const TelefonesPage({Key key, this.title = "Telefones"}) : super(key: key);

  @override
  _TelefonesPageState createState() => _TelefonesPageState();
}

class _TelefonesPageState extends State<TelefonesPage> {

  Firestore db = Firestore.instance;
  final getIt = GetIt.I.get<SaudeController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder(
        stream: db.collection("telefones").document(getIt.cidade).collection("corona").snapshots(),
        builder:(context, snapshot){

          if(snapshot.data == null){
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[

                  Center(
                    child: CircularProgressIndicator()
                    )

                ]
              );
          }else{

          //DocumentSnapshot documentSnapshot = snapshot.data;
          //Map<String, dynamic> dados = documentSnapshot.data;

          QuerySnapshot querySnapshot = snapshot.data;
          List<DocumentSnapshot> dados = querySnapshot.documents.toList();

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Text("Carregando decretos ...")
              ],
            );
            break;

            case ConnectionState.active:
            case ConnectionState.done:
            
            if(snapshot.hasError){

              return Text("ERRO");

            }else if(!snapshot.hasData){

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[

                  Center(
                    child: Text("Nenhum dado encontrado.")
                    )

                ]
              );

            }else{

              return ListView.builder(
            itemCount: dados.length,
            itemBuilder: (context, indice){

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    ListTile(
                      title: Text(dados[indice]['local']),
                      subtitle: Text("Telefone: ${dados[indice]['telefone']}"),
                      trailing: Icon(Icons.phone, color: Colors.red,),
                      leading: Icon(Icons.home),
                      onTap: () async{
                        if(await canLaunch("tel:${dados[indice]['telefone']}")){
                          await launch("tel:${dados[indice]['telefone']}");
                        }else{
                          print("Não foi possivel realizar está operação!");
                        }
                      },
                    ),

                  ],
                  ),
              );    
            }

            );
            }
              
              break;
            
          }

          }

          return Text("");

          
        }
        ),
    );
  }
}

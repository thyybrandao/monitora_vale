
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidvale/app/modules/home/pages/decretos/web.dart';
import 'package:covidvale/app/modules/home/pages/saude/saude_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DecretosPage extends StatefulWidget {
  final String title;
  const DecretosPage({Key key, this.title = "Decretos"}) : super(key: key);

  @override
  _DecretosPageState createState() => _DecretosPageState();
}

class _DecretosPageState extends State<DecretosPage> {

  Firestore db = Firestore.instance;
  final getIt = GetIt.I.get<SaudeController>();
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: db.collection("decretos").document(getIt.cidade).collection("corona").getDocuments().asStream(),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[

                  Center(
                    child: CircularProgressIndicator()
                    )

                ]
              );
            case ConnectionState.active:
            case ConnectionState.done:
            
            if(snapshot.hasError){

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[

                  Center(
                    child: Text("Nenhum dado encontrado.")
                    )

                ]
              );

            }else if(snapshot.hasData){

              return ListView.builder(
            itemCount: dados.length,
            itemBuilder: (context, indice){

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    ListTile(
                      title: Text("Decreto: ${dados[indice]['data']}"),
                      subtitle: Text("Edição: ${dados[indice]['edicao']}"),
                      trailing: Icon(Icons.visibility, semanticLabel: "LER",),
                      leading: Icon(Icons.description),
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(
                          builder: (_)=> WebDecreto(
                            url: dados[indice]['link'],
                            data: dados[indice]['data'],
                            edicao: dados[indice]['edicao'],
                        )
                          )
                            );

                      },
                    ),



                  ],
                  ),
              );
            }

            );

            }else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[

                  Center(
                    child: Text("Nenhum dado encontrado.")
                    )

                ]
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

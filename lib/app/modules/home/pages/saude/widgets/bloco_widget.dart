import 'package:flutter/material.dart';

class BlocoWidget extends StatefulWidget {

  final String titulo;
  final String total;
  final String novos;
  final List<Color> gradient;

  const BlocoWidget({Key key, this.titulo, this.total, this.novos, this.gradient}) : super(key: key);
  

  @override
  _BlocoWidgetState createState() => _BlocoWidgetState();
}

class _BlocoWidgetState extends State<BlocoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                width: MediaQuery.of(context).size.width/1,
                height: MediaQuery.of(context).size.height/5.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors:widget.gradient, 
                    stops: [0.1,2]
                    )
                ),
                child: Column(
                  children: <Widget>[

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                      Text(widget.titulo, style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),)

                    ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                      Column(
                        children: <Widget>[

                          Container(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            //color: Colors.blue,
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 9,
                            child: Column(
                              children: <Widget>[
                                Text(widget.total,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text("TOTAL DE CASOS", style: TextStyle(
                                  color: Colors.white
                                ),
                                )
                              ]
                            ),
                          )

                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            //color: Colors.blue,
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 9,
                            child: Column(
                              children: <Widget>[
                                Text(widget.novos,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text("HOJE", style: TextStyle(
                                  color: Colors.white
                                ),
                                )
                              ]
                            ),
                          )
                        ],
                      )

                    ],
                    ),


                  ],
                ),
              );
  }
}
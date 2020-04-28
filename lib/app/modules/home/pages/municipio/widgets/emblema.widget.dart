import 'package:flutter/material.dart';

class Emblema extends StatefulWidget {

  final String municipio;
  final int tamanho;

  const Emblema({Key key, this.municipio, this.tamanho}) : super(key: key);

  @override
  _EmblemaState createState() => _EmblemaState();
}

class _EmblemaState extends State<Emblema> {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/${widget.municipio}.jpg",
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / widget.tamanho,
            );
  }
}
import 'package:flutter/material.dart';

class Tabela extends StatefulWidget {

  final String populacao;
  final String totalLeitos;
  final String leitosVagos;
  final String hospitais;
  final String postosSaude;
  final String upa;

  const Tabela({ 
    this.populacao, 
    this.totalLeitos, 
    this.leitosVagos, 
    this.hospitais, 
    this.postosSaude, 
    this.upa
    });
  
  @override
  _TabelaState createState() => _TabelaState();
}

class _TabelaState extends State<Tabela> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: [
            DataColumn(label: Text("")),
            DataColumn(label: Text(""))
        ],
        rows: [
            DataRow(cells: [
              DataCell(Text("População")),
              DataCell(Text(widget.populacao.toString())),
            ]),

            DataRow(cells: [
              DataCell(Text("Total leitos")),
              DataCell(Text(widget.totalLeitos.toString())),
            ]),

            DataRow(cells: [
              DataCell(Text("Leitos vagos")),
              DataCell(Text(widget.leitosVagos.toString())),
            ]),

            DataRow(cells: [
              DataCell(Text("Hospitais")),
              DataCell(Text(widget.hospitais.toString())),
            ]),

            DataRow(cells: [
              DataCell(Text("Postos de Saúde")),
              DataCell(Text(widget.postosSaude.toString())),
            ]),

            DataRow(cells: [
              DataCell(Text("UPAs")),
              DataCell(Text(widget.upa.toString())),
            ]),
        ],
            );
  }
}
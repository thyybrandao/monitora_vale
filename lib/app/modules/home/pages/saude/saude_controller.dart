import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'saude_controller.g.dart';

class SaudeController = _SaudeControllerBase with _$SaudeController;

abstract class _SaudeControllerBase with Store {
  

  @observable 
  String cidade ="registro";


  @observable
  String titulocidade = "Registro-SP";
  

  @action
  void mudaCidade(String value){ 
    cidade = value; 
    print("Cidade mudou para: " + cidade);
    }


  @action
  String mudatitulo(String value) { 

    switch (value) {

      case "registro":
         titulocidade = "Registro-SP";
        break;

      case "miracatu":
         titulocidade = "Miracatu-SP";
        break;

      case "pariquera":
         titulocidade = "Pariquera-Açu/SP";
        break;

      case "cajati":
         titulocidade = "Cajati-SP";
        break;

      case "jacupiranga":
         titulocidade = "Jacupiranga-SP";
        break;

      case "juquia":
         titulocidade = "Juquiá-SP";
        break;

      case "cananeia":
         titulocidade = "Cananéia-SP";
        break;

      case "iguape":
         titulocidade = "Iguape-SP";
        break;

      case "ilhacomprida":
         titulocidade = "Ilha Comprida-SP";
        break;

      case "eldorado":
        titulocidade = "Eldorado-SP";
        break;

      case "setebarras":
         titulocidade = "Sete Barras-SP";
        break;
      
    }
    print("Titulo mudou para: " + titulocidade);
    return titulocidade;

    }


  @action
  Stream pegaCidade(String cidade){

    Firestore db = Firestore.instance;

    return db.collection("cidades").document(cidade).snapshots();
  }


}

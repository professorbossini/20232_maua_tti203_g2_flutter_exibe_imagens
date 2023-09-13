import 'package:exibe_imagens/src/widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './models/image_model.dart';

class App extends StatefulWidget {
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int numeroImagens = 1;
  List<ImageModel> imagens = [];

  //async/await
  void obterImagem() async {
    //https://api.pexels.com/v1/search?query=people
    var url = Uri.https(
      'api.pexels.com',
      '/v1/search',
      {
        'query': 'people',
        'per_page': '1',
        'page': '$numeroImagens',
      },
    );
    var req = http.Request('get', url);
    req.headers.addAll({
      'Authorization':
          '563492ad6f91700001000001e00b21ab6afb45a18c1d44a759556f14',
    });
    final result = await req.send();
    final response = await http.Response.fromStream(result);
    //pegar o JSON(string), converter para Map e converter para a classe de Modelo (ImageModel)
    final decodedJSON = json.decode(response.body);
    final imagem = ImageModel.fromJSON(decodedJSON);
    setState(() {
      imagens.add(imagem);
      numeroImagens++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(imagens),
        appBar: AppBar(title: const Text("Minhas Imagens")),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: obterImagem,
        ),
      ),
    );
  }
}

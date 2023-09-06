import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int numeroImagens = 0;

  void obterImagem() {
    //https://api.pexels.com/v1/search?query=people
    var url = Uri.https(
      'api.pexels.com',
      '/v1/search',
      {
        'query': 'people',
        'per_page': '1',
        'page': '1',
      },
    );
    var req = http.Request('get', url);
    req.headers.addAll({
      'Authorization':
          '563492ad6f91700001000001e00b21ab6afb45a18c1d44a759556f14',
    });
    //IO-Bound (input/output)
    req.send().then((result) {
      http.Response.fromStream(result).then((response) {
        print(response.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('$numeroImagens'),
        appBar: AppBar(title: const Text("Minhas Imagens")),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: obterImagem,
        ),
      ),
    );
  }
}

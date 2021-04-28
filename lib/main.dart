import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/* 
  StatelessWidget são widgets SEM o controle de estado, ou seja:
  - Estático
  - Não possibilita alterações dinâmicas
  - Utilizado para criar estruturas como menus etc, elementos não dinâmicos
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Exemplo de tela inicial'),
    );
  }
}

/*
  StatefulWidget são widgets COM o controle de estado, ou seja:
  - Mutáveis
  - Usados apenas quanto existe a necessidade de alterar informações da tela
*/
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Classe responsável por gerenciar os estados do StatefulWidget
class _MyHomePageState extends State<MyHomePage> {
  int _contador = 0;

  void _incrementarContador() {
    // método responsável por setar as alterações de status
    setState(() {
      _contador++;
    });
  }

  // Cria widget
  @override
  Widget build(BuildContext context) {
    // Scaffold é a estrutura básica, que permite o appBar
    return Scaffold(
      // appBar e body são atributos passados na inicialização da classe Scaffold
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // children é um atributo do tipo lista de widgets
          children: <Widget>[
            Text(
              'Quantidade de vezes que o botão foi pressionado: ',
            ),
            Text(
              '$_contador',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarContador,
        tooltip: 'Incrementar',
        child: Icon(Icons.add),
      ),
    );
  }
}

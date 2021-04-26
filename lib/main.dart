import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/* 
  StatelessWidget são widgets SEM o controle de estado, ou seja:
  - Estático
  - Não possibilita alterações dinâmicas
  - Utilizado para criar estruturas como menus etc, elementos não dinamicos
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

class _MyHomePageState extends State<MyHomePage> {
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController usuarioController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();

  String _textoInfo = "Informe seus dados";

  void _limpar_Tela(){
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {

      _textoInfo = "Informe seus dados";

    });
  }

  void _cadastrar(){
    setState(() {

      String usuario = (usuarioController.text);

      String senha = (senhaController.text);

      usuarioController.text = "";
      senhaController.text = "";

      _textoInfo = "Dados cadastrados com sucesso!";

      if (usuario.isEmpty){
        _textoInfo = "preencha os dados corretamente!";
      }

      if (senha.isEmpty){
        _textoInfo = "preencha os dados corretamente!";
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text("Cadastro de usuário"),
          centerTitle: true,
          backgroundColor: Colors.yellow,

          actions: <Widget>[

            IconButton(
                onPressed: _limpar_Tela,
                icon: Icon(Icons.refresh)
            ),

          ]

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            const Icon(
                Icons.person,
                size: 120.0,
                color: Colors.yellow
            ),

            TextField(

              keyboardType: TextInputType.text,
              decoration: InputDecoration(

                labelText: "Usuario",
                labelStyle: TextStyle(color: Colors.black),

              ),

              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuarioController,


            ),

            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(

                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.black),

              ),

              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: senhaController,


            ),

            Padding(padding: const EdgeInsets.only(top: 10, bottom: 10),

              child: SizedBox(

                height: 50.0,

                child: ElevatedButton(

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)
                  ),

                    onPressed: _cadastrar,

                    child: const Text("Cadastrar")




                ),

              ),

            ),

            Text(
              _textoInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25.0
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:calculadora_flutter/models/funcoes.dart';
import 'package:flutter/material.dart';
import '../components/display.dart';
import '../components/keyboard.dart';

class Calculadora extends StatefulWidget {
  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final Funcoes funcoes = Funcoes();

  _pressionado(String comando) {
    setState(() {
      funcoes.aplicarComando(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display(funcoes.value),
          Keyboard(_pressionado),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  static const DARK = Color.fromRGBO(83, 83, 83, 1);
  static const PADRAO = Color.fromRGBO(112, 112, 112, 1);
  static const OPERACAO = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) retorno;

  Botao({
    required this.text,
    this.big = false,
    this.color = PADRAO,
    required this.retorno,
  });
  Botao.grande({
    required this.text,
    this.big = true,
    this.color = PADRAO,
    required this.retorno,
  });
  Botao.operacao({
    required this.text,
    this.big = false,
    this.color = OPERACAO,
    required this.retorno,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color, // Defina a cor aqui
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w300,
          ),
        ),
        onPressed: () =>retorno(text),
      ),
    );
  }
}

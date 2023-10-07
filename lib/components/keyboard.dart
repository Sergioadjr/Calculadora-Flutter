import 'package:flutter/material.dart';
import 'botao.dart';
import 'botao_linha.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) retorno;

  Keyboard(this.retorno);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(children: <Widget>[
        BotaoNaLinha([
          Botao.grande(text: 'AC', color: Botao.DARK,retorno:retorno),
          Botao(text: '%', color: Botao.DARK, retorno:retorno),
          Botao.operacao(text: '÷', retorno:retorno),
        ]),
        SizedBox(height: 1.5),
        BotaoNaLinha([
          Botao(text: '7', retorno:retorno),
          Botao(text: '8', retorno:retorno),
          Botao(text: '9', retorno:retorno),
          Botao.operacao(text: 'x', retorno:retorno),
        ]),
        SizedBox(height: 1.5),
        BotaoNaLinha([
          Botao(text: '4', retorno:retorno),
          Botao(text: '5', retorno:retorno),
          Botao(text: '6', retorno:retorno),
          Botao.operacao(text: '-', retorno:retorno),
        ]),
        SizedBox(height: 1.5),
        BotaoNaLinha([
          Botao(text: '1', retorno:retorno),
          Botao(text: '2', retorno:retorno),
          Botao(text: '3', retorno:retorno),
          Botao.operacao(text: '+', retorno:retorno),
        ]),
        SizedBox(height: 1.5),
        BotaoNaLinha([
          Botao.grande(text: '0', retorno:retorno),
          Botao(text: '.', retorno:retorno),
          Botao.operacao(text: '=', retorno:retorno),
        ]),
      ]),
    );
  }
}

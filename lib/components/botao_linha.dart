import 'package:flutter/material.dart';
import 'botao.dart';

class BotaoNaLinha extends StatelessWidget {
  final List<Botao> botoes;

  BotaoNaLinha(this.botoes);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: botoes.fold(<Widget>[], (list, b) {
          list.isEmpty ? list.add(b) : list.addAll([SizedBox(width: 1), b]);
          return list;
        }),
      ),
    );
  }
}

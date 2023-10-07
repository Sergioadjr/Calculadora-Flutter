class Funcoes {
  static const operacoes = const ['%', '÷', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operacao;
  String _valor = '';
  bool _limparValor = false;
  String? _ultimoComando;

  void aplicarComando(String comando) {
    if (_substituindoOperacao(comando)) {
      _operacao = comando;
      return;
    }
    if (comando == 'AC') {
      _allClear();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _adicionarDigito(comando);
    }
    _ultimoComando = comando;
  }

  _substituindoOperacao(String comando) {
    return operacoes.contains(_ultimoComando) &&
        operacoes.contains(comando) &&
        _ultimoComando != '=' &&
        comando != '=';
    ;
  }

  _setOperacao(String novaOperacao) {
    bool ehSinalDeIgual = novaOperacao == '=';
    if (_bufferIndex == 0) {
      if (!ehSinalDeIgual) {
        _operacao = novaOperacao;
        _bufferIndex = 1;
        _limparValor = true;
      }
    } else {
      _buffer[0] = _calcular();
      _buffer[1] = 0.0;
      _valor = _buffer[0].toString();
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;

      _operacao = ehSinalDeIgual ? null : novaOperacao;
      _bufferIndex = ehSinalDeIgual ? 0 : 1;
    }
    _limparValor = !ehSinalDeIgual;
    // _limparValor = true;
    // Esta linha acima (comentada) é uma variável booleana que controla se o valor atual deve ser "limpo" ou não quando tiver o sinal de '='. Isto é, se o valor deve ser substituído completamente ou se deve ser adicionado um novo dígito ao valor existente;
  }

  _adicionarDigito(String digito) {
    final ehPonto = digito == '.';
    final limparValor = (_valor == '0' && !ehPonto) || _limparValor;

    if (ehPonto && _valor.contains('.') && !limparValor) {
      return;
    }

    final valorVazio = ehPonto ? '0' : '';
    final atualValor = limparValor ? valorVazio : _valor;
    _valor = atualValor + digito;
    _limparValor = false;

    _buffer[_bufferIndex] = double.tryParse(_valor) ?? 0;
  }

  _allClear() {
    _valor = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _operacao = null;
    _bufferIndex = 0;
    _limparValor = false;
  }

  _calcular() {
    switch (_operacao) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '÷':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get valor {
    return _valor;
  }
}

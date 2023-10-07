class Funcoes {
  String _value = '';

  void aplicarComando(String comando) {
    if (comando == 'AC') {
      _allClear();
    } else {
      _value += comando;
    }
  }

  _allClear() {
    _value = '0';
  }

  String get value {
    return _value;
  }
}

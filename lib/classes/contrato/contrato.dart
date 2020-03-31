
abstract class Contrato {
  String _termo, _assinaturaDir, _assinaturaAt;
  double _valor;
  DateTime _dtinicio, _dtfinal;

  get termo => this._termo;
  get valor => this._valor;
  get assinaturaDir => this._assinaturaDir;
  get assinaturaAt => this._assinaturaAt;
  get inicio => this._dtinicio;
  get dtfinal => this._dtfinal;

  String listarDadosContrato() {
    return " \nTermo - $termo  \nValor - $valor  \nData de início - $inicio  \nData final - $dtfinal  \nAssinatura do Diretor do time - $assinaturaDir  \nAssinatura do atleta - $assinaturaAt";
  }
}

class ContratoRecisao extends Contrato {
  ContratoRecisao(termo, valor, assinaturaAt, assinaturaDir, dtinicio, dtfinal);
}

class ContratoAdesao extends Contrato {
  ContratoAdesao(termo, valor, assinaturaAt, assinaturaDir, dtinicio, dtfinal);
}

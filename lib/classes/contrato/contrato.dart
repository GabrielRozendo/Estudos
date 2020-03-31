
class Contrato  {
  
  String _termo, _assinaturaDir, _assinaturaAt,_tipo;
  double _valor;
  DateTime _dtinicio, _dtfinal;
   
  get tipo => this._tipo;
  set tipo(String tipo) => this._tipo = tipo;
  get termo => this._termo;
  get valor => this._valor;
  get assinaturaDir => this._assinaturaDir;
  get assinaturaAt => this._assinaturaAt;
  get inicio => this._dtinicio;
  get dtfinal => this._dtfinal;
   
   Contrato(this._tipo,this._termo,this._valor,this._dtinicio,this._dtfinal,this._assinaturaAt,this._assinaturaDir);


  String listarDadosContrato() {
    return "\nTipo do contrato: $tipo \nTermo - $termo  \nValor - $valor  \nData de início - $inicio  \nData final - $dtfinal  \nAssinatura do Diretor do time - $assinaturaDir  \nAssinatura do atleta - $assinaturaAt";
  }
}


import "Texto.dart";

class Contrato {
  String _termo;
  String _assinaturaDir;
  String _assinaturaAt;
  String _tipo;
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

  Contrato(this._tipo, this._termo, this._valor, this._dtinicio, this._dtfinal,
      this._assinaturaAt, this._assinaturaDir);

  String listarDadosContrato() {
    return Texto.listarDaddosC(this.tipo, this.termo, this.valor, this.inicio,
        this.dtfinal, this.assinaturaDir, this.assinaturaAt);
  }
}

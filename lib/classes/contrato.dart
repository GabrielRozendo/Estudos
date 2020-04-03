import "Texto.dart";

class Contrato {
  String termo;
  String assinaturaDir;
  String assinaturaAt;
  String tipo;
  double valor;
  DateTime dtinicio;
  DateTime dtfinal;

  Contrato(this.tipo, this.termo, this.valor, this.dtinicio, this.dtfinal,
      this.assinaturaAt, this.assinaturaDir);

  @override
  toString()
  {
    return Texto.listarDaddosC(tipo, termo, valor, dtinicio, dtfinal, assinaturaDir, assinaturaAt);
  }

}

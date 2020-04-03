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

  String listarDadosContrato() {
    return Texto.listarDaddosC(this.tipo, this.termo, this.valor, this.dtinicio,
        this.dtfinal, this.assinaturaDir, this.assinaturaAt);
  }
}

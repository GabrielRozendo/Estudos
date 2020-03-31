import"lib/classes/pessoa/pessoa.dart";
import"lib/classes/contrato/contrato.dart";
import"lib/classes/atleta/atleta.dart";

class Diretor extends Pessoa {
  void fazerContratoAdesao(Atleta atleta, double valor, String termos, DateTime dtinicio, DateTime dtfinal) {
    atleta.contratoA = ContratoAdesao(
    termos, valor, atleta.assinar(), this.assinar(), dtinicio, dtfinal);
  }

  void fazerContratoRecisao(Atleta atleta, double valor, String termos,ContratoAdesao contratoAdesao) {
    atleta.contratoR = ContratoRecisao(termos, valor, atleta.assinar(),
    this.assinar(), contratoAdesao.inicio, contratoAdesao.dtfinal);
  }
}
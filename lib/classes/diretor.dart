import "pessoa.dart";
import "contrato.dart";
import "atleta.dart";

class Diretor extends Pessoa {
  Diretor(String nome, int idade, double peso, String cpf, String assinatura)
      : super(nome, idade, peso, cpf, assinatura);

  void fazerContrato(Atleta atleta, double valor, String termos,
      DateTime dtinicio, DateTime dtfinal, String tipo) {
    atleta.contrato = Contrato(tipo, termos, valor, dtinicio, dtfinal,
        atleta.assinar(), this.assinar());
  }
}

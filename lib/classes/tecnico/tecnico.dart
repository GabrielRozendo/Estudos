import"lib/classes/pessoa/pessoa.dart";
import "lib/classes/planejamentoT/planejamentoT.dart";
import"lib/classes/atleta/atleta.dart";

class Tecnico extends Pessoa {
  PlanejamentoTreino _treino;

  get treino => this._treino;

  Tecnico(String nome,int idade,double peso,String cpf,String assinatura)
  {
    this._nome = nome;
    this._idade = idade;
    this._peso = peso;
    this._cpf = cpf;
    this._assinatura= assinatura;
  }

  bool testarAtleta(int idade, double peso) {
    if (idade >= 18 && peso > 60) {
      return true;
    } else {
      return false;
    }
  }

  void condicaoAtleta(Atleta atleta) {
    print("O ${atleta.nome} está com ${atleta.peso}");
  }

  void planejarTreino(String instrucoes, DateTime data) {
    PlanejamentoTreino treino = PlanejamentoTreino(instrucoes, data, this.assinar());
    this._treino = treino;
  }
}

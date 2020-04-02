import "pessoa.dart";
import "planejamentoT.dart";
import "atleta.dart";
import "Texto.dart";

class Tecnico extends Pessoa {
  PlanejamentoTreino _treino;

  get treino => this._treino;

  Tecnico(String nome,int idade,double peso,String cpf,String assinatura):super(nome,idade,peso,cpf,assinatura);

  bool testarAtleta(int idade, double peso) {
    if (idade >= 18 && peso > 60) {
      return true;
    } else {
      return false;
    }
  }

  void condicaoAtleta(Atleta atleta) {
    print(Texto.condicaoA(atleta.nome, atleta.peso));
  }

  void planejarTreino(String instrucoes, DateTime data) {
    PlanejamentoTreino treino = PlanejamentoTreino(instrucoes, data, this.assinar());
    this._treino = treino;
  }
}

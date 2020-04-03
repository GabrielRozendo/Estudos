import "diretor.dart";
import "tecnico.dart";
import "atleta.dart";
import "Texto.dart";
import "planejamentoT.dart";

class Time {
  String nome;
  final String cnpj;
  double fundoMonetario;
  List _atletas = <Atleta>[];
  Diretor diretor;
  Tecnico tecnico;

  Time(
    this.nome,
    this.cnpj,
    this.fundoMonetario,
    this.diretor,
    this.tecnico,
  );

  set atletas(Atleta atleta) => this._atletas.add(atleta);

  @override
  String toString() {
    _listarDaddosA();
  }

  void contratarAtleta(Atleta atleta, double valor, String termos,
      DateTime dtinicio, DateTime dtfinal) {
    bool _resultadoTeste = this.tecnico.testarAtleta(atleta.idade, atleta.peso);
    if (_resultadoTeste) {
      String tipo = "Adesao";
      this
          .diretor
          .fazerContrato(atleta, valor, termos, dtinicio, dtfinal, tipo);
      this.atletas = atleta;
      this.fundoMonetario -= valor;
      print(Texto.contratarA(atleta.nome));
    } else {
      print(Texto.recusarA(atleta.nome));
    }
  }

  void venderAtleta(Atleta atleta, double valor, String termos,
      DateTime dtinicio, DateTime dtfinal) {
    String tipo = "Recisão";
    this.diretor.fazerContrato(atleta, valor, termos, dtinicio, dtfinal, tipo);
    this._atletas.removeWhere((atletas) => atleta.cpf == atletas.cpf);
    this.fundoMonetario += valor;
    print(Texto.venderA(atleta.nome));
  }

  void pagarAtleta(Atleta atleta, double valor) {
    this.fundoMonetario -= valor;
    atleta.salario += valor;
    print(Texto.pagarA(atleta.nome));
  }

  PlanejamentoTreino _obterTreino() => this.tecnico.treino;

  void executarTreino() {
    String _instrucoes = _obterTreino().instrucoes;
    String _assinatura = _obterTreino().assinaturaTecnico;
    if (_instrucoes.isNotEmpty && this.tecnico.assinatura == _assinatura) {
      DateTime _data = _obterTreino().data;
      String _instrucoes = _obterTreino().instrucoes;
      return print(Texto.executarTreino(this.tecnico.nome, _data, _instrucoes));
    } else {
      return print(Texto.negarT());
    }
  }

  void _listarDaddosA() {
    if (this._atletas.length == 0) {
      print(Texto.semAtletas());
    } else {
      return this._atletas.forEach((item) => print(item.toString()));
    }
  }
}

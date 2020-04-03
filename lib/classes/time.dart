import "diretor.dart";
import "tecnico.dart";
import "atleta.dart";
import "Texto.dart";
import "planejamentoT.dart";

class Time {
  String _nome;
  final String _cnpj;
  double _fundoMonetario;
  List _atletas = <Atleta>[];
  Diretor _diretor;
  Tecnico _tecnico;

  Time(
    this._nome,
    this._cnpj,
    this._fundoMonetario,
    this._diretor,
    this._tecnico,
  );

  get nome => this._nome;
  get cnpj => this._cnpj;
  set fundoMonetario(double dinheiro) => this._fundoMonetario = dinheiro;
  get fundoMonetario => this._fundoMonetario;
  set diretor(Diretor diretor) => this._diretor = diretor;
  get diretor => this._diretor;
  set tecnico(Tecnico tecnico) => this._tecnico = tecnico;
  get tecnico => this._tecnico;
  set atletas(Atleta atleta) => this._atletas.add(atleta);

  void contratarAtleta(Atleta atleta, double valor, String termos,
      DateTime dtinicio, DateTime dtfinal) {
      bool _resultadoTeste = this._tecnico.testarAtleta(atleta.idade, atleta.peso);
    if (_resultadoTeste) {
      String tipo = "Adesao";
      this._diretor.fazerContrato(atleta, valor, termos, dtinicio, dtfinal, tipo);
      this.atletas = atleta;
      this._fundoMonetario -= valor;
      print(Texto.contratarA(atleta.nome));
    } else {
      print(Texto.recusarA(atleta.nome));
    }
  }

  void venderAtleta(Atleta atleta, double valor, String termos,
    DateTime dtinicio, DateTime dtfinal) {
    String tipo = "Recisão";
    this._diretor.fazerContrato(atleta, valor, termos, dtinicio, dtfinal, tipo);
    this._atletas.removeWhere((atletas) => atleta.cpf == atletas.cpf);
    this._fundoMonetario += valor;
    print(Texto.venderA(atleta.nome));
  }

  void pagarAtleta(Atleta atleta, double valor) {
    fundoMonetario -= valor;
    atleta.salario += valor;
    print(Texto.pagarA(atleta.nome));
  }

  PlanejamentoTreino _obterTreino() => this._tecnico.treino;

  void executarTreino() {
    String _instrucoes = _obterTreino().instrucoes;
    String _assinatura = _obterTreino().assinatura;
    if (_instrucoes.isNotEmpty && this._tecnico.assinatura == _assinatura) {
      String _data = _obterTreino().data;
      String _instrucoes = _obterTreino().instrucoes;
      return print(
          Texto.executarTreino(this._tecnico.nome, _data, _instrucoes));
    } else {
      return print(Texto.negarT());
    }
  }

  void listarDaddosA() {
    if (this._atletas.length == 0) {
      print(Texto.semAtletas());
    } else {
      return this._atletas.forEach((item) => print(item.toString()));
    }
  }
}

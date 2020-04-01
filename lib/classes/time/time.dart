import"lib/classes/diretor/diretor.dart";
import"lib/classes/tecnico/tecnico.dart";
import"lib/classes/atleta/atleta.dart";

class Time {
  String _nome, _cnpj;
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
    if (this._tecnico.testarAtleta(atleta.idade, double.parse(atleta.peso)) ==true) 
    {
      String tipo = "Adesao";
      this._diretor.fazerContrato(atleta, valor, termos, dtinicio, dtfinal,tipo);
      this.atletas = atleta;
      this._fundoMonetario -= valor;
      print("O ${atleta.nome} foi contratado!");
    } else {
      print("O ${atleta.nome} foi recusado");
    }
  }

  void venderAtleta(Atleta atleta, double valor, String termos,DateTime dtinicio,DateTime dtfinal) 
  {
    String tipo = "Recisão";
    this._diretor.fazerContrato(atleta, valor, termos,dtinicio,dtfinal,tipo);
    this._atletas.removeWhere((atletas) => atleta.cpf == atletas.cpf);
    this._fundoMonetario += valor;
    print("O atleta ${atleta.nome} foi vendido");
  }

  void pagarAtleta(Atleta atleta, double valor) {
    fundoMonetario -= valor;
    atleta.salario += valor;
    print("O ${atleta.nome} foi pago");
  }

  PlanejamentoTreino _obterTreino() {
    return this._tecnico.treino;
  }

  void executarTreino() {
    if (_obterTreino().instrucoes != "" && this._tecnico.assinatura == _obterTreino().assinatura) {
      return print("O técnico ${this._tecnico.nome} ira aplicar um treino na data de ${_obterTreino().data},as instruções seguem abaixo \n${_obterTreino().instrucoes}");
    } else {
      return print("Treino negado");
    }
  }

  void listarDaddosA() {
    if (this._atletas.length == 0) {
      print("O time não possui atletas");
    } else {
      return this._atletas.forEach((item) => print(item.listarDados()));
    }
  }
}
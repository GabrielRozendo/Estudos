void main() {
  Atleta ok = Atleta();
  ok.nome = "Pedro";
  ok.idade = 18;
  ok.peso = 76;
  ok.cpf = "121.692.176-33";
  ok.assinatura = "pedro";
  ok.modalidade = "Futsal";
  ok.salario = 500;
  ok.comer(9000);
  ok.treinar(7000);
  ok.gastarSalario(500);

  Atleta ok2 = Atleta();
  ok2.nome = "Peter";
  ok2.idade = 18;
  ok2.peso = 90;
  ok2.cpf = "121.690.176-33";
  ok2.assinatura = "pete";
  ok2.modalidade = "Fut";
  ok2.salario = 600;
  ok2.comer(8000);
  ok2.treinar(1000);
  ok2.gastarSalario(500);

  Tecnico ok3 = Tecnico();
  ok3.nome = "Ricardo";
  ok3.idade = 46;
  ok3.peso = 80;
  ok3.cpf = "111.111.111-11";
  ok3.salario = 1000;
  ok3.assinatura = "teste";
  ok3.planejarTreino("Teste", DateTime.parse("2001-12-06"));

  Diretor ok4 = Diretor();
  ok4.nome = "Paulo";
  ok4.idade = 57;
  ok4.peso = 80;
  ok4.cpf = "112.111.111-11";
  ok4.salario = 10000;
  ok4.assinatura = "teste1";

  Time vasco = Time("nome", "1111", 10000, ok4, ok3);

  vasco.contratarAtleta(ok, 10000, "tesedasasasdasf",
      DateTime.parse("2011-12-06"), DateTime.parse("2012-12-06"));
  vasco.contratarAtleta(ok2, 10000, "tesaaaaaaaaaaaaaasf",
      DateTime.parse("2011-06-06"), DateTime.parse("2012-06-06"));
  vasco.pagarAtleta(ok, 1000);
  vasco.venderAtleta(ok, 10, "tadsadsadasdas");
  vasco.listarDaddosA();
}

abstract class Pessoa {
  String _nome;
  int _idade;
  double _peso;
  String _cpf;
  double _salario;
  String _assinatura;

  set nome(String nome) => this._nome = nome;
  get nome => this._nome;

  set idade(int idade) => this._idade = idade;
  get idade => this._idade;

  set peso(double peso) => this._peso = peso;
  get peso => this._peso.toStringAsPrecision(4);

  set cpf(String cpf) => this._cpf = cpf;
  get cpf => this._cpf;

  set assinatura(String assinatura) =>
      this._assinatura = assinatura.hashCode.toString();
  get assinatura => this._assinatura;

  set salario(double dinheiro) => this._salario = dinheiro;
  get salario => this._salario;

  String assinar() => assinatura;
}

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
    if (this._tecnico.testarAtleta(atleta.idade, double.parse(atleta.peso)) ==
        true) {
      this._diretor.fazerContratoAdesao(atleta, valor, termos, dtinicio, dtfinal);
      this.atletas = atleta;
      this._fundoMonetario -= valor;
      print("O ${atleta.nome} foi contratado!");
    } else {
      print("O ${atleta.nome} foi recusado");
    }
  }

  void venderAtleta(Atleta atleta, double valor, String termos) {
    this._diretor.fazerContratoRecisao(atleta, valor, termos, atleta.contratoA);
    this._atletas.removeWhere((atletas) => atleta.cpf == atletas.cpf);
    this._fundoMonetario += valor;
    print("O atleta ${atleta.nome} foi vendido");
  }

  void pagarAtleta(Atleta atleta, double valor) {
    //ideia --> o atleta já foi pago?, TALVEZ adicionar data, talvez um boleto?;

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

class Tecnico extends Pessoa {
  PlanejamentoTreino _treino;

  get treino => this._treino;

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

class PlanejamentoTreino {
  String _instrucoes;
  DateTime _data;
  String _assinaturaTecnico;

  get instrucoes => this._instrucoes;

  get data => this._data;

  get assinatura => this._assinaturaTecnico;

  PlanejamentoTreino(this._instrucoes, this._data, this._assinaturaTecnico);
}

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

abstract class Contrato {
  String _termo, _assinaturaDir, _assinaturaAt;
  double _valor;
  DateTime _dtinicio, _dtfinal;

  get termo => this._termo;
  get valor => this._valor;
  get assinaturaDir => this._assinaturaDir;
  get assinaturaAt => this._assinaturaAt;
  get inicio => this._dtinicio;
  get dtfinal => this._dtfinal;

  String listarDadosContrato() {
    return " \nTermo - $termo  \nValor - $valor  \nData de início - $inicio  \nData final - $dtfinal  \nAssinatura do Diretor do time - $assinaturaDir  \nAssinatura do atleta - $assinaturaAt";
  }
}

class ContratoRecisao extends Contrato {
  ContratoRecisao(termo, valor, assinaturaAt, assinaturaDir, dtinicio, dtfinal);
}

class ContratoAdesao extends Contrato {
  ContratoAdesao(termo, valor, assinaturaAt, assinaturaDir, dtinicio, dtfinal);
}

class Atleta extends Pessoa {
  String _modalidade;
  ContratoAdesao _contratoA;
  ContratoRecisao _contratoR;

  set modalidade(String modalidade) => this._modalidade = modalidade;
  get tipo => this._modalidade;

  set contratoA(ContratoAdesao contrato) => this._contratoA = contrato;
  get contratoA => this._contratoA;

  set contratoR(ContratoRecisao contrato) => this._contratoR = contrato;
  get contratoR => this._contratoR;

  void verContratoA() {
    return print(this._contratoA.listarDadosContrato());
  }

  void verContratoR() {
    return print(this._contratoR.listarDadosContrato());
  }

  void gastarSalario(double dinheiro) {
    if (dinheiro > salario) {
      print(
          "$nome não pode gastar essa quantia, o salário atual é de $salario reais");
    } else {
      this._salario -= dinheiro;
      print("O atleta $nome gastou $dinheiro e agora tem $salario reais");
    }
  }

  void treinar(double calorias) {
    print(
        "O atleta $nome treinou e perdeu ${_pesoPerdido(calorias)}! E agora esta com ${peso}Kg");
  }

  String _pesoPerdido(double calorias) {
    calorias /= 7000;

    if (calorias > 1 || calorias == 1) {
      this._peso -= calorias;
      return calorias.toStringAsPrecision(2) + "Kg";
    } else {
      this._peso -= calorias;
      calorias *= 100;
      return calorias.toStringAsPrecision(2) + "g";
    }
  }

  void comer(double calorias) {
    print(
        "O atleta $nome comeu e ganhou ${_pesoGanho(calorias)}! E agora esta com ${peso}Kg");
  }

  String _pesoGanho(double calorias) {
    calorias /= 7000;

    if (calorias > 1 || calorias == 1) {
      this._peso += calorias;
      return calorias.toStringAsPrecision(2) + "Kg";
    } else {
      this._peso += calorias;
      calorias *= 100;
      return calorias.toStringAsPrecision(2) + "g";
    }
  }

  String listarDados() {
    return "\nNome:$nome \nIdade:$idade \nPeso:$peso \nCpf:$cpf \nTipo:$tipo \nSalário:$salario \nAssinatura:$assinatura \nContrato de adesão: ${this._contratoA.listarDadosContrato()}";
  }
}

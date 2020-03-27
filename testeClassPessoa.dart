// Copyright 2015 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

void main() {
  Atleta ok = Atleta();
  ok.nome = "Pedro";
  ok.idade = 16;
  ok.peso = 76;
  ok.cpf = "121.692.176-33";
  ok.assinatura = "pedro";
  ok.modalidade = "Futsal";
  ok.salario = 500;
  ok.comer(9000);
  ok.treinar(7000);
  ok.gastarSalario(500);
  ok.listarDados();

  Tecnico ok2 = Tecnico();
  ok2.nome = "Ricardo";
  ok2.idade = 46;
  ok2.peso = 80;
  ok2.cpf = "111.111.111-11";
  ok2.salario = 1000;
  ok2.assinatura = "teste";
  ok2.planejarTreino("Teste", DateTime.parse("2001-12-06"));

  Diretor ok3 = Diretor();
  ok3.nome = "Paulo";
  ok3.idade = 57;
  ok3.peso = 80;
  ok3.cpf = "112.111.111-11";
  ok3.salario = 10000;
  ok3.assinatura = "teste1";

  Time vasco = Time("nome", "1111", 10000, ok3, ok2);
  vasco.executarTreino();
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
}

class Time {
  String _nome, _cnpj;
  double _fundoMonetario;
  Diretor _diretor;
  Tecnico _tecnico;

  Time(this._nome, this._cnpj, fundoMonetario, this._diretor, this._tecnico);

  get nome => this._nome;
  get cnpj => this._cnpj;
  set fundoMonetario(double dinheiro) => this._fundoMonetario = dinheiro;
  get fundoMonetario => this._fundoMonetario;
  set diretor(Diretor diretor) => this._diretor = diretor;
  get diretor => this._diretor;
  set tecnico(Tecnico tecnico) => this._tecnico = tecnico;
  get tecnico => this._tecnico;

  /* void contratarAtleta(Atleta atleta, double valorAtleta, Diretor diretor) {
    //validar com a assinatura do diretor
    fundoMonetario -= valorAtleta;
    atletas(atleta);
    print("O ${atleta.nome} foi contratado por um valor de $valorAtleta");
  } 

  void venderAtleta(String cpf, double valorVenda, Diretor diretor) {
    //validar com a assinatura do diretor
    fundoMonetario += valorVenda;
    this._atletas.removeWhere((item) =>
        cpf == item.nome); //tem que testar, talvez o item.nome não funcione
    print("O ${atletas.nome} foi vendido por um valor de $valorVenda");
  }

  void pagarAtleta(String cpf, double valor, Diretor diretor) {
    //validar com assinatura do diretor (ideia --> o atleta já foi pago?)
    fundoMonetario -= valor;
    this._atletas .forEach(); //em aprendizado ainda, vendo tbm se tem uma maneira melhor de fazer
  } */

  PlanejamentoTreino _obterTreino() {
    return this._tecnico.treino;
  }

  void executarTreino() {
    if (_obterTreino().instrucoes != "" &&
        this._tecnico.assinatura == _obterTreino().assinatura) {
      return print(
          "O técnico ${this._tecnico.nome} ira aplicar um treino na data de ${_obterTreino().data},as instruções seguem abaixo \n${_obterTreino().instrucoes}");
    } else {
      return print("Treino negado");
    }
  }
}

class Tecnico extends Pessoa {
  PlanejamentoTreino _treino;

  get treino => this._treino;

  String assinar() {
    return assinatura;
  }

  void condicaoAtleta(Atleta atleta) {
    print("O ${atleta.nome} está com ${atleta.peso}");
  }

  void planejarTreino(String instrucoes, DateTime data) {
    PlanejamentoTreino treino = PlanejamentoTreino();
    treino.instrucoes = instrucoes;
    treino.data = data;
    treino.assinatura = this.assinar();
    this._treino = treino;
  }
}

class PlanejamentoTreino {
  String _instrucoes;
  DateTime _data;
  String _assinaturaTecnico;

  set instrucoes(String instrucoes) => this._instrucoes = instrucoes;
  get instrucoes => this._instrucoes;

  set data(DateTime data) => this._data = data;
  get data => this._data;

  set assinatura(String assinatura) => this._assinaturaTecnico = assinatura;
  get assinatura => this._assinaturaTecnico;
}

class Diretor extends Pessoa {
  String assinar() {
    return assinatura;
  }
}

class Atleta extends Pessoa {
  String _modalidade;

  set modalidade(String modalidade) => this._modalidade = modalidade;
  get tipo => this._modalidade;

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

  void listarDados() {
    return print(
        "Nome:$nome \nIdade:$idade \nPeso:$peso \nCpf:$cpf \nTipo:$tipo \nSalário:$salario \nAssinatura:$assinatura");
  }
}

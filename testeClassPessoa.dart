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
  BancoAtletas.cadastrarAtleta(ok);

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

  Time vasco = Time("nome", "1111",10000, ok3, ok2);
  
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
  List _atletas = <Atleta>[];
  Diretor _diretor;
  Tecnico _tecnico;

  Time(this._nome, this._cnpj, this._fundoMonetario, this._diretor, this._tecnico,);

  get nome => this._nome;
  get cnpj => this._cnpj;
  set fundoMonetario(double dinheiro) => this._fundoMonetario = dinheiro;
  get fundoMonetario => this._fundoMonetario;
  set diretor(Diretor diretor) => this._diretor = diretor;
  get diretor => this._diretor;
  set tecnico(Tecnico tecnico) => this._tecnico = tecnico;
  get tecnico => this._tecnico;
  set atletas(Atleta atleta) => this._atletas.add(atleta);

  
  
  
   void contratarAtleta(Atleta atleta,double valor,String termos,DateTime dtinicio,dtfinal)
   {
     if(this._tecnico.testarAtleta(atleta) == true)
     {     atleta.contrato=this._diretor.fazerContrato(termos,dtinicio,dtfinal,atleta,valor);
      this.atletas = atleta;
      print("O ${atleta.nome} foi contratado!");
       
     }
     
     
     else
     {
       print("O ${atleta.nome} foi recusado");
     }
     
   }
  

  

 /* void venderAtleta(String cpf, double valorVenda, Diretor diretor) {
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
  
  bool testarAtleta(Atleta atleta)
  {
    if(atleta.idade > 18 && atleta.peso > 60){return true;}
    else{return false;}
  }

  void condicaoAtleta(Atleta atleta) {
    print("O ${atleta.nome} está com ${atleta.peso}");
  }

  void planejarTreino(String instrucoes, DateTime data) {
    PlanejamentoTreino treino = PlanejamentoTreino(instrucoes,data,this.assinar());
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
  
  PlanejamentoTreino(this._instrucoes,this._data,this._assinaturaTecnico);
}







class Diretor extends Pessoa {
  
  Contrato fazerContrato(String termos,DateTime dtinicio,dtfinal,Atleta atleta,double valor)
  {
    Contrato contrato = Contrato(termos,valor,atleta.assinar(),this.assinar(),dtinicio,dtfinal);
    return contrato;
  }
  
  String assinar() {
    return assinatura;
  }
}


class Contrato
{
  String _termo,_assinaturaDir,_assinaturaAt;
  double _valor;
  DateTime _dtinicio,_dtfinal;
  
  get termo => this._termo;
  get valor => this._valor;
  get assinaturaDir => this._assinaturaDir;
  get assinaturaAt => this._assinaturaAt;
  get inicio => this._dtinicio;
  get dtfinal => this._dtfinal;  
  Contrato(this._termo,this._valor,this._assinaturaAt,this._assinaturaDir,this._dtinicio,this._dtfinal);
  
 void listarDados(){print("Termo:$termo \nValor:$valor \nData de início:$inicio \nData final:$dtfinal \nAssinatura do Diretor do time: $assinaturaDir \nAssinatura do atleta: $assinaturaAt");} 
  
  
}










class Atleta extends Pessoa {
  String _modalidade;
  Contrato _contrato;

  set modalidade(String modalidade) => this._modalidade = modalidade;
  get tipo => this._modalidade;
  
  set contrato(Contrato contrato) => this._contrato = contrato;
  get contrato => this._contrato.listarDados();
  
 String assinar() {
    return assinatura;
  }
  
  
  void verContrato()
  {
    return print(contrato);
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

  void listarDados() {
    return print(
        "Nome:$nome \nIdade:$idade \nPeso:$peso \nCpf:$cpf \nTipo:$tipo \nSalário:$salario \nAssinatura:$assinatura");
  }
}

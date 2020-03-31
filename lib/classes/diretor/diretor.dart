import"lib/classes/pessoa/pessoa.dart";
import"lib/classes/contrato/contrato.dart";
import"lib/classes/atleta/atleta.dart";

class Diretor extends Pessoa {

  Diretor(String nome,int idade,double peso,String cpf,String assinatura)
  {
    this._nome = nome;
    this._idade = idade;
    this._peso = peso;
    this._cpf = cpf;
    this._assinatura= assinatura;
  }

  void fazerContrato(Atleta atleta, double valor, String termos, DateTime dtinicio, DateTime dtfinal,String tipo) {
    atleta.contrato = Contrato(tipo,termos,valor,dtinicio,dtfinal,atleta.assinar(),this.assinar());
    
  }
}
import"lib/classes/pessoa/pessoa.dart";
import"lib/classes/contrato/contrato.dart";
import"lib/classes/Texto/Texto.dart";

class Atleta extends Pessoa {
  String _modalidade;
  Contrato _contrato;

  set modalidade(String modalidade) => this._modalidade = modalidade;
  get tipo => this._modalidade;

  set contrato(Contrato this._contrato) => this._contrato = contrato;
  get contrato => this._contrato;
  
  Atleta(String nome,int idade,double peso,String cpf,String assinatura,this._modalidade):super(nome,idade,peso,cpf,assinatura);
 
  void gastarSalario(double dinheiro) {
    if (dinheiro > salario) {
     print(Texto.gastoNegadotxt(this.nome, this.salario));
    } else {
      this._salario -= dinheiro;
       print(Texto.gastoAprovadotxt(this.nome, dinheiro, this.salario));
    }
  }

  void treinar(double calorias) {
    print(Texto.treinar(this.nome, _pesoperdido, this.peso));
  }

  String _pesoPerdido(double calorias) {
    calorias /= 7000;

    if (calorias >= 1) {
      this._peso -= calorias;
      return calorias.toStringAsPrecision(2) + "Kg";
    } else {
      this._peso -= calorias;
      calorias *= 100;
      return calorias.toStringAsPrecision(2) + "g";
    }
  }

   void comer(double calorias) {
    final String _pesoAdquirido = _pesoGanho(calorias);
    print(Texto.comer(this.nome, _pesoAdquirido, this.peso));
  }

  String _pesoGanho(double calorias) {
    calorias /= 7000;

    if (calorias >= 1) {
      this._peso += calorias;
      return calorias.toStringAsPrecision(2) + "Kg";
    } else {
      this._peso += calorias;
      calorias *= 100;
      return calorias.toStringAsPrecision(2) + "g";
    }
  }

  String listarDados() {
    return Texto.listarDadosA(this.nome, this.modalidade, this.assinatura,this.cpf, this.idade, this.peso, this.salario, this.contrato);
  }
}

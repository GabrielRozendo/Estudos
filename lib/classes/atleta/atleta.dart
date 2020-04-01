import"lib/classes/pessoa/pessoa.dart";
import"lib/classes/contrato/contrato.dart";

class Atleta extends Pessoa {
  String _modalidade;
  Contrato _contrato;

  set modalidade(String modalidade) => this._modalidade = modalidade;
  get tipo => this._modalidade;

  get contrato => this._contrato;
  
  Atleta(String nome,int idade,double peso,String cpf,String assinatura,this._modalidade):super(nome,idade,peso,cpf,assinatura);
 
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
    print(
        "O atleta $nome comeu e ganhou $_pesoAdquirido! E agora esta com ${peso}Kg");
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
    return "\nNome:$nome \nIdade:$idade \nPeso:$peso \nCpf:$cpf \nTipo:$tipo \nSalário:$salario \nAssinatura:$assinatura \nContrato de adesão: ${this._contrato.listarDadosContrato()}";
  }
}

import "pessoa.dart";
import "contrato.dart";
import "Texto.dart";

class Atleta extends Pessoa {
  String modalidade;
  Contrato _contrato;

  set contrato(Contrato contrato) => this._contrato = contrato;
  get contrato => this._contrato;

  Atleta(String nome, int idade, double peso, String cpf, String assinatura,
      this.modalidade)
      : super(nome, idade, peso, cpf, assinatura);

  @override
  String toString() {
    return Texto.listarDadosA(
        nome, modalidade, assinatura, cpf, idade, peso, salario, contrato);
  }

  void gastarSalario(double dinheiro) {
    if (dinheiro > salario) {
      print(Texto.gastoNegadotxt(this.nome, this.salario));
    } else {
      this.salario -= dinheiro;
      print(Texto.gastoAprovadotxt(this.nome, dinheiro, this.salario));
    }
  }

  void treinar(double calorias) {
    final String _pesoperdido = _pesoPerdido(calorias);
    print(Texto.treinar(this.nome, _pesoperdido, this.peso));
  }

  String _pesoPerdido(double calorias) {
    calorias /= 7000;
    this.peso -= calorias;
    if (calorias >= 1) {
      return calorias.toStringAsPrecision(2) + "Kg";
    } else {
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
    this.peso += calorias;
    if (calorias >= 1) {
      return calorias.toStringAsPrecision(2) + "Kg";
    } else {
      calorias *= 100;
      return calorias.toStringAsPrecision(2) + "g";
    }
  }
}

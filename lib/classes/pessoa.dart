abstract class Pessoa {
  String nome;
  int _idade;
  double _peso;
  final String cpf;
  double salario;
  String assinatura;

  set idade(int idade) => this._idade = idade;
  get idade => this._idade;

  set peso(double peso) => this._peso = peso;
  get peso => this._peso;

  String assinar() => assinatura;

  Pessoa(this.nome, this._idade, this._peso, this.cpf, this.assinatura,this.salario);
}

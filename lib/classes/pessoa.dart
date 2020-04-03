abstract class Pessoa {
  String nome;
  int _idade;
  double peso;
  final String cpf;
  double salario;
  String assinatura;

  set idade(int idade) => this._idade = idade;
  get idade => this._idade;
  
  Pessoa(this.nome, this._idade, this.peso, this.cpf, this.assinatura,this.salario);
}

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
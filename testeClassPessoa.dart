void main()
{

}


abstract class Pessoa
{
  
  String _nome;
  int _idade;
  String _cpf;
  
  set nome(String nome){this._nome = nome;}
  get nome => this._nome;
  
  set idade(int idade){this._idade = idade;}
  get idade => this._idade;
  
  set cpf(String cpf){this._cpf = cpf;}
  get cpf => this._cpf;
  
 
  
  
}


class Atleta extends Pessoa
{
  String _tipo;
  double _peso;
  int _numMedalhas;
  
  set tipo(String tipo){this._tipo = tipo;}
  get tipo => this._tipo;
  
  set peso(double peso){this._peso = peso;}
  get peso => this._peso;
  
  set medalhas(int medalhas){this._numMedalhas = medalhas;}
  get medalhas => this._numMedalhas;
}
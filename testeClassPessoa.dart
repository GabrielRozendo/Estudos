void main() {

Atleta ok = Atleta();
  ok.nome = "Pedro";
  ok.peso = 120;
  ok.treinar(2000);
 

}


abstract class Pessoa
{
  
  String _nome;
  int _idade;
  double _peso;
  String _cpf;
  
  set nome(String nome){this._nome = nome;}
  get nome => this._nome;
  
  set idade(int idade){this._idade = idade;}
  get idade => this._idade;
  
  set peso(double peso){this._peso = peso;}
  get peso => this._peso.toStringAsPrecision(4);
  
  set cpf(String cpf){this._cpf = cpf;}
  get cpf => this._cpf;
  
 
  
  
}


class Atleta extends Pessoa
{
  String _tipo;
  int _numMedalhas;
  
  set tipo(String tipo){this._tipo = tipo;}
  get tipo => this._tipo;

  set medalhas(int medalhas){this._numMedalhas = medalhas;}
  get medalhas => this._numMedalhas;
  

  
   void treinar(double calorias)
  {
     
    print("O atleta $nome treinou e perdeu ${_pesoPerdido(calorias)}kg! E agora esta com ${peso}Kg");
   
  }
  
  
String _pesoPerdido(double calorias)
  {
  
    if(calorias == 70000){
       calorias = 1 ;
       this._peso -= calorias;
    }
    
     else{
       calorias = (calorias/7000);
       
       this._peso -= calorias;
       
       
     }
    
   return calorias.toStringAsPrecision(2);  
  }
  
  
}
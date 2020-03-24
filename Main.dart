void main()
{
   Pessoa p1 = Pessoa();
  p1.nome = "Pedro";
  p1._altura = 1.76;
  p1._niver =  DateTime.parse("2003-06-12");
 print(p1.dados());

}

class Pessoa
{

   String _nome;
  double _altura;
  DateTime _niver;
  
  
  set nome(String nome){this._nome = nome;}
  String get nome{return this._nome;}
  
   int idade(){return DateTime.now().year- niver.year;}
  
  set altura(double altura){this._altura = altura;}
  double get altura{return this._altura;}
  
  set niver(DateTime niver){this._niver = niver;}
  DateTime get niver{return this._niver;}

  String dados()
  {
    
    return "Nome: "+nome+"\nIdade: "+idade().toString()+"\nAltura: "+altura.toString()+"\nNiver: "+niver.toString();
  }



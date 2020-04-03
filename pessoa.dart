void main()
{
    Pessoa p1 = Pessoa("Pedro", 1.76, DateTime.parse("2003-12-06"));
    print(p1.dados());

}

class Pessoa {

    final String _nome;
    double _altura;
    DateTime _niver;

    Pessoa(this._nome, this._altura, this._niver);

     get nome => this._nome.toUpperCase(); 
     get altura => this._altura; 
     get niver => this._niver;

    int idade() {
        return DateTime.now().difference(niver).inDays~/365;}

        String dados() {

            return "Nome:$nome\nIdade:${idade().toString()}\nAltura:${altura.toString()}\nNiver:${niver.toString()}";
        }

    }
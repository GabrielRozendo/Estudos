void main()
{
    Pessoa p1 = Pessoa("Pedro", 1.76, DateTime.parse("2003-06-12"));
    print(p1.dados());

}

class Pessoa {

    String _nome;
    double _altura;
    DateTime _niver;

    Pessoa(String nome, double altura, DateTime niver) {
        this._nome = nome;
        this._altura = altura;
        this._niver = niver;

    }

    String get nome{ return this._nome.toUpperCase(); }
    double get altura{ return this._altura; }
    DateTime get niver{ return this._niver; }

    int idade() {

        if (DateTime.now().month - niver.month == 0) {

            return (DateTime.now().year - niver.year);
        }

        else { return (DateTime.now().year - niver.year) - 1; }
    }

    String dados() {

        return "Nome:$nome\nIdade:${idade().toString()}\nAltura:${altura.toString()}\nNiver:${niver.toString()}";
    }

}
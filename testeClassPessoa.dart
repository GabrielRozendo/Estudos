void main() {

    Atleta ok = Atleta();
    ok.nome = "Pedro";

}


abstract class Pessoa {

    String _nome;
    int _idade;
    double _peso;
    String _cpf;

    set nome(String nome) => this._nome = nome;
    get nome => this._nome;

    set idade(int idade) => this._idade = idade;
    get idade => this._idade;

    set peso(double peso) => this._peso = peso;
    get peso => this._peso.toStringAsPrecision(4);

    set cpf(String cpf)=> this._cpf = cpf;
    get cpf => this._cpf;

    }


class Atleta extends Pessoa {
    String _tipo;
    int _salario;

    set tipo(String tipo) { this._tipo = tipo; }
    get tipo => this._tipo;

    set salario(int dinheiro){ this._salario = salario; }
    get salario => this._salario;

void receberSalario(double dinheiro)
{
  this._salario += dinheiro;
  print("O atleta $nome recebeu  $dinheiro e agora tem $salario reais");
  
}
  
  
  void gastarSalario(double dinheiro)
  {
    this._salario -= dinheiro;
    print("O atleta $nome recebeu $dinheiro e agora tem $salario reais");
  }

void treinar(double calorias)
{

    print("O atleta $nome treinou e perdeu ${_pesoPerdido(calorias)}! E agora esta com ${peso}Kg");

}


String _pesoPerdido(double calorias)
{

    calorias /= 7000;

    if (calorias > 1 || calorias == 1) {
        this._peso -= calorias;
        return calorias.toStringAsPrecision(2) + "Kg";
    }


    else {
        this._peso -= calorias;
        calorias *= 100;
        return calorias.toStringAsPrecision(2) + "g";
    }


}


void comer(double calorias)
{
    print("O atleta $nome comeu e ganhou ${_pesoGanho(calorias)}! E agora esta com ${peso}Kg");
}


String _pesoGanho(double calorias)
{

    calorias /= 7000;

    if (calorias > 1 || calorias == 1) {
        this._peso += calorias;
        return calorias.toStringAsPrecision(2) + "Kg";
    }


    else {
        this._peso += calorias;
        calorias *= 100;
        return calorias.toStringAsPrecision(2) + "g";
    }


}

void listarDados()
{

    return print("Nome:$nome \nIdade:$idade \nPeso:$peso \nCpf:$cpf \nTipo:$tipo \nNúmero de medalhas:$medalhas");
}
}
void main() {

    Atleta ok = Atleta();
    ok.nome = "Pedro";

}


class Time
{
  String _nome, _cnpj;
  double _fundoMonetario;
  var _atletas = List();
  Diretor _diretor;
  Tecnico _tecnico;
  
  Time(this._nome,this._cnpj,fundoMonetario,atletas(atleta),diretor(diretor),this._tecnico);
  
  get nome=> this._nome;
  get cnpj => this._cnpj;
  set fundoMonetario(double dinheiro) => this._fundoMonetario = dinheiro;
  get fundoMonetario => this._fundoMonetario;
  set atletas(Atleta atleta) =>this._atletas.add(atleta);
  get atletas => this._atletas;
  set diretor(Diretor diretor) => this._diretor = diretor;
  get diretor => this._diretor;
  set tecnico(Tecnico tecnico) => this._tecnico = tecnico;
  get tecnico => this._tecnico;
  
    void contratarAtleta(Atleta atleta,double valorAtleta)
  {
     fundoMonetario -= valorAtleta;
     atletas(atleta);
     print("O ${atleta.nome} foi contratado por um valor de $valorAtleta");
  }
  
  
  void venderAtleta(Atleta atleta,double valorVenda,Diretor diretor)
  {
    fundoMonetario += valorVenda;
    this._atletas.remove(atletas);
    print("O ${atleta.nome} foi vendido por um valor de $valorVenda");
  }
  
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




class Diretor extends Pessoa{
  
  final String _assinatura;
  set assinatura => ;
  get assinatura => this._assinatura;
  
  String assinar()
  {
    return this._assinatura;
  }
}




class Tecnico extends Pessoa
{
  void planejarTreino(String nomeTreino)
  {
    print("O técnico $nome está planejando um treino de $nomeTreino");
  }
  
  
  void madarTreino(Atleta atletas){
    print("O técnico $nome está executando o treino para o(s) $atletas");
   
  }
  
  
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

    return print("Nome:$nome \nIdade:$idade \nPeso:$peso \nCpf:$cpf \nTipo:$tipo \nSalário:$salario");
}
}
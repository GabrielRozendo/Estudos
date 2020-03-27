void main() {

   //EXECUTAR TESTES 1 DE CADA vEZ ---PS: FAZER TODAS AS VALIDAÇÕES ANTES DE TESTAR
   //organizar melhor as classes e talvez adicionar outras pra deixar tudo mais organizado


}


class Time
{
  String _nome, _cnpj;
  double _fundoMonetario;
  var _atletas = List(); //olhar se não tem um modo mais específico para escrever lista + testar pra ver se tá dando pra colocar os objetos
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
  
    void contratarAtleta(Atleta atleta,double valorAtleta,Diretor diretor)
  {
    //validar com a assinatura do diretor
     fundoMonetario -= valorAtleta;
     atletas(atleta);
     print("O ${atleta.nome} foi contratado por um valor de $valorAtleta");
  }
  
  
   void venderAtleta(String cpf,double valorVenda,Diretor diretor)
  {
    //validar com a assinatura do diretor
    fundoMonetario += valorVenda;
    this._atletas.removeWhere((item)=> cpf == item.nome); //tem que testar, talvez o item.nome não funcione  
    print("O ${atletas.nome} foi vendido por um valor de $valorVenda");
  }

  void pagarAtleta(String cpf, double valor,Diretor diretor)
  {
    //validar com assinatura do diretor (ideia --> o atleta já foi pago?)
    fundoMonetario -= valor;
    this._atletas.forEach(); //em aprendizado ainda, vendo tbm se tem uma maneira melhor de fazer 
    
  }



   void planejarTreino(String nomeTreino,Tecnico tecnico)
  {
    //validar o planjamento com a assinatura do tecnico
    print("O técnico $nome está planejando um treino de $nomeTreino");
  }
  
  
  void madarTreino(Atleta atletas,Tecnico tecnico)
  {
    //validar o treino com a assinatura do tecnico
    //fazer o envio para o atleta | testar se a list tá funcionando e como atribuir o treino para todos os atletas e(ou) só alguns atletas
    print("O técnico $nome está executando o treino para o(s) $atletas");
   
  }
  
}



abstract class Pessoa {
  String _nome;
  int _idade;
  double _peso;
  String _cpf;
  double _salario;

  set nome(String nome) => this._nome = nome;
  get nome => this._nome;

  set idade(int idade) => this._idade = idade;
  get idade => this._idade;

  set peso(double peso) => this._peso = peso;
  get peso => this._peso.toStringAsPrecision(4);

  set cpf(String cpf) => this._cpf = cpf;
  get cpf => this._cpf;

  set salario(double dinheiro) => this._salario = dinheiro;
  get salario => this._salario;
}




class Diretor extends Pessoa{
  
  final String _assinatura = "teste teste".hashCode.toString(); //trocar para GUID, usar API uuid?
  get assinatura => this._assinatura;


  String assinar()
  {
    return assinatura;
  }
}




class Tecnico extends Pessoa
{
 
    final String _assinatura = "teste teste".hashCode.toString(); //trocar para GUID, usar API uuid?
  get assinatura => this._assinatura;


  String assinar()
  {
    return assinatura;
  }
  
}







class Atleta extends Pessoa {
  String _modalidade;

  set modalidade(String modalidade) => this._modalidade = modalidade;
  get tipo => this._modalidade;

  void gastarSalario(double dinheiro) {
    if(dinheiro > salario){
      print("$nome não pode gastar essa quantia, o salário atual é de $salario reais");
    }
    else{
    this._salario -= dinheiro;
    print("O atleta $nome gastou $dinheiro e agora tem $salario reais");
    }
  }

  void treinar(double calorias) {
    print(
        "O atleta $nome treinou e perdeu ${_pesoPerdido(calorias)}! E agora esta com ${peso}Kg");
  }

  String _pesoPerdido(double calorias) {
    calorias /= 7000;

    if (calorias > 1 || calorias == 1) {
      this._peso -= calorias;
      return calorias.toStringAsPrecision(2) + "Kg";
    } else {
      this._peso -= calorias;
      calorias *= 100;
      return calorias.toStringAsPrecision(2) + "g";
    }
  }

  void comer(double calorias) {
    print(
        "O atleta $nome comeu e ganhou ${_pesoGanho(calorias)}! E agora esta com ${peso}Kg");
  }

  String _pesoGanho(double calorias) {
    calorias /= 7000;

    if (calorias > 1 || calorias == 1) {
      this._peso += calorias;
      return calorias.toStringAsPrecision(2) + "Kg";
    } else {
      this._peso += calorias;
      calorias *= 100;
      return calorias.toStringAsPrecision(2) + "g";
    }
  }

  void listarDados() {
    return print(
        "Nome:$nome \nIdade:$idade \nPeso:$peso \nCpf:$cpf \nModalidade:$modalidade \nSalário:$salario");
  }
}

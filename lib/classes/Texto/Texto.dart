class Texto {
  static String gastoAprovadotxt(String nome, double dinheiro, salario) {
    return "O atleta $nome gastou $dinheiro e agora tem $salario reais";
  }

  static String gastoNegadotxt(String nome, double salario) {
    return "$nome não pode gastar essa quantia, o salário atual é de $salario reais";
  }

  static String treinar(String nome, String pesoPerdido, String peso) {
    return "O atleta $nome comeu e ganhou $pesoPerdido! E agora esta com ${peso}Kg";
  }

  static String comer(String nome, String pesoAdquirido, String peso) {
    return "O atleta $nome comeu e ganhou $pesoAdquirido! E agora esta com ${peso}Kg";
  }

  static String listarDadosA(String nome, String tipo, String assinatura,
      String cpf, int idade, String peso, double salario, Contrato contrato) {
    return "\nNome:$nome \nIdade:$idade \nPeso:$peso \nCpf:$cpf \nTipo:$tipo \nSalário:$salario \nAssinatura:$assinatura \nContrato de adesão: ${contrato.listarDadosContrato()}";
  }

  static String listarDaddosC(
      String tipo,
      String termo,
      double valor,
      DateTime inicio,
      DateTime dtfinal,
      String assinaturaDir,
      String assinaturaAt) 
  {
    return "\nTipo do contrato: $tipo \nTermo - $termo  \nValor - $valor  \nData de início - $inicio  \nData final - $dtfinal  \nAssinatura do Diretor do time - $assinaturaDir  \nAssinatura do atleta - $assinaturaAt";
  }

  static String condicaoA(String nome, String peso) {
    return "O $nome está com $peso";
  }

  static String contratarA(String nome) {
    return "O atleta $nome foi contratado!";
  }

  static String recusarA(String nome) {
    return "O atleta $nome foi recusado";
  }

  static String venderA(String nome) {
    return "O atleta $nome foi vendido";
  }

  static String pagarA(String nome) {
    return "O $nome foi pago";
  }

  static String executarTreino(String nome, String data, String instrucoes) {
    return "O técnico $nome ira aplicar um treino na data de $data,as instruções seguem abaixo \n$instrucoes";
  }

  static String negarT() {
    return "O treino foi negado";
  }

  static String semAtletas() {
    return "O time não possui atletas";
  }
}
import"lib/classes/time/time.dart";
import"lib/classes/atleta/atleta.dart";
import"lib/classes/diretor/diretor.dart";
import"lib/classes/tecnico/tecnico.dart";

void main() {
  Atleta ok = Atleta();
  ok.nome = "Pedro";
  ok.idade = 18;
  ok.peso = 76;
  ok.cpf = "121.692.176-33";
  ok.assinatura = "pedro";
  ok.modalidade = "Futsal";
  ok.salario = 500;
  ok.comer(9000);
  ok.treinar(7000);
  ok.gastarSalario(500);

  Atleta ok2 = Atleta();
  ok2.nome = "Peter";
  ok2.idade = 18;
  ok2.peso = 90;
  ok2.cpf = "121.690.176-33";
  ok2.assinatura = "pete";
  ok2.modalidade = "Fut";
  ok2.salario = 600;
  ok2.comer(8000);
  ok2.treinar(1000);
  ok2.gastarSalario(500);

  Tecnico ok3 = Tecnico();
  ok3.nome = "Ricardo";
  ok3.idade = 46;
  ok3.peso = 80;
  ok3.cpf = "111.111.111-11";
  ok3.salario = 1000;
  ok3.assinatura = "teste";
  ok3.planejarTreino("Teste", DateTime.parse("2001-12-06"));

  Diretor ok4 = Diretor();
  ok4.nome = "Paulo";
  ok4.idade = 57;
  ok4.peso = 80;
  ok4.cpf = "112.111.111-11";
  ok4.salario = 10000;
  ok4.assinatura = "teste1";

  Time vasco = Time("nome", "1111", 10000, ok4, ok3);

  vasco.contratarAtleta(ok, 10000, "tesedasasasdasf",
      DateTime.parse("2011-12-06"), DateTime.parse("2012-12-06"));
  vasco.contratarAtleta(ok2, 10000, "tesaaaaaaaaaaaaaasf",
      DateTime.parse("2011-06-06"), DateTime.parse("2012-06-06"));
  vasco.pagarAtleta(ok, 1000);
  vasco.venderAtleta(ok, 10, "tadsadsadasdas");
  vasco.listarDaddosA();
}








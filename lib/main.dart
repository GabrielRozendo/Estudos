import 'classes/atleta.dart';
import 'classes/tecnico.dart';
import 'classes/diretor.dart';
import 'classes/time.dart';

void main() {
  Atleta ok = Atleta("Pedro",18,76,"121.692.176-33","pedro","Futsal");
  ok.salario = 500;
  ok.comer(9000);
  ok.treinar(7000);
  ok.gastarSalario(500);

  Atleta ok2 = Atleta("Peter",18,90,"121.690.176-33","pete","Fut");
  ok2.salario = 600;
  ok2.comer(8000);
  ok2.treinar(1000);
  ok2.gastarSalario(500);

  Tecnico ok3 = Tecnico("Ricardo",46,80,"111.111.111-11","teste");
  ok3.salario = 1000;
  ok3.planejarTreino("Teste", DateTime.parse("2001-12-06"));

  Diretor ok4 = Diretor("Paulo",57,80,"121.111.111-11","teste1");
  ok4.salario = 10000;

  Time vasco = Time("nome", "1111", 10000, ok4, ok3);

  vasco.contratarAtleta(ok, 10000, "tesedasasasdasf",DateTime.parse("2011-12-06"), DateTime.parse("2012-12-06"));
  vasco.contratarAtleta(ok2, 10000, "tesaaaaaaaaaaaaaasf",DateTime.parse("2011-06-06"), DateTime.parse("2012-06-06"));
  vasco.pagarAtleta(ok, 1000);
  vasco.venderAtleta(ok,10,"tadsadsadasdas",DateTime.parse("2011-12-06"),DateTime.parse("2012-12-06"));
  vasco.listarDaddosA();
}








void main(){
  // cosnt vs final
  // ignore: unused_local_variable
  const NUMERO = 1;
  // ignore: unused_local_variable
  final int NUMERO2;
  NUMERO2 = 2; 
  //NUMERO2 = 3; // error

  // Tipos de datos
  // ignore: unused_local_variable
  int numero = 1;
  // ignore: unused_local_variable
  double numero2 = 1.1;
  // ignore: unused_local_variable
  bool booleano = true;
  // ignore: unused_local_variable
  String texto = "Hola";
  // ignore: unused_local_variable
  dynamic dinamico = "Hola";
  dinamico = 1;
  dinamico = true;

  // Estrucuturas de datos
  // ignore: unused_local_variable
  List lista = [1,2,3,4,5];
  lista.add(6);
  lista.remove(1);
  // ignore: unused_local_variable
  List<int> lista2 = [1,2,3,4,5];
  // ignore: unused_local_variable
  List<String> lista3 = ["1","2","3","4","5"];

  // ignore: unused_local_variable, equal_elements_in_set
  Set colores = {"Rojo","Verde","Azul", "Azul"}; // imprime solo 3 elementos: Rojo, Verde, Azul

  //map
  // ignore: unused_local_variable
  Map persona = {
    "nombre": "Juan",
    "apellido": "Perez",
    "edad": 35
  };

  persona["nombre"] = "Pedro";


}
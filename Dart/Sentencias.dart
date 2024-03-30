void main(){
  var distacia = 100;
  var tiempo = 9.58;

  // ignore: unused_local_variable
  var velocidad = distacia / tiempo;

  print(velocidad);

  if (true) {
    print("Hola Mundo");
  }

  // ignore: dead_code
  if (false) {
    print("Hola Mundo");
  } else {
    print("Hola Mundo");
  }

  // ignore: dead_code
  if (false) {
    print("Hola Mundo");
  } else if (true) {
    print("Hola Mundo");
  // ignore: dead_code
  } else {
    print("Hola Mundo");
  }

  switch (1) {
    case 1:
      print("Hola Mundo");
      break;
    case 2:
      print("Hola Mundo");
      break;
    default:
      print("Hola Mundo");
  }

  try{
    print("Hola Mundo");
  } catch(e){
    print("Hola Mundo");
  } finally {
    print("Hola Mundo");
  }

  for (var i = 0; i < 10; i++) {
    print("Hola Mundo");
  }

  var i = 0;
  while (i < 10) {
    print("Hola Mundo");
    i++;
  }

  var j = 0;
  do {
    print("Hola Mundo");
    j++;
  } while (j < 10);

  mifuncion();
  // ignore: unused_local_variable
  int resultado = mifuncion2(1,2);

  persona p = new persona("Juan", "Perez", 35);
  p.saludar();

  deportista d = new deportista("Juan", "Perez", 35, "Futbol");
  d.saludar();
  d.hacerDeporte();

  // Clases abstractas
  Gato g = new Gato();
  g.nacer();
  g.comer("Pescado");
  g.hablar();

  // Interfaces
  Perro perro = new Perro();
  perro.nacer();
  perro.comer("Croquetas");
  perro.hablar();
}

void mifuncion(){
  print("Hola Mundo");
}

int mifuncion2(int a, int b){
  return a + b;
}

class persona{
  String nombre;
  String apellido;
  int edad;

  persona(this.nombre, this.apellido, this.edad);

  void saludar(){
    print("Hola Mundo");
  }
}

class deportista extends persona{
  String deporte;

  deportista(String nombre, String apellido, int edad, this.deporte) : super(nombre, apellido, edad);

  @override
  void saludar(){
    print("Hola, soy $nombre $apellido y tengo $edad años. Mi deporte es $deporte");
  }

  void hacerDeporte(){
    print("Hola, soy $nombre y estoy haciendo $deporte");
  }
}

// Clases abstractas
abstract class Animal {
  var id;
  var especie;

  nacer() => print("Naciendo ...");
  comer(var comida) => print("Comiendo $comida");
  hablar();
}

class Gato extends Animal {
  var nombre;
  var botas;

  @override
  hablar() => print("Mew");
}

// Interfaces
class Perro implements Animal {
  var id;
  var especie;
  var nombre;
  var botas;

  @override
  nacer() => print("Naciendo ...");

  @override
  comer(var comida) => print("Comiendo $comida");

  @override
  hablar() => print("Guau");
}
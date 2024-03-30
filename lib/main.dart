import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 29, 171, 253)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String memoria = "0";
  String respuesta = "0";
  List<String> operadores = ["+", "-", "x", "/"];
  List<double> numeros = [];

  void concatenar(String boton){
    setState(() {
      if (respuesta == "0") {
        respuesta = boton;
      } else {
        respuesta = respuesta + boton;
      }
    });
  }

  void evaluarOperacion() {
    numeros = extraerNumeros(respuesta);
    operadores = extraerOperadores(respuesta);

    //primero se evaluan las multiplicaciones y divisiones de los parentesis del ultimo nivel
    for (int i = 0; i < operadores.length; i++) {
      if (operadores[i] == "x" || operadores[i] == "/") {
        if (operadores[i] == "x") {
          numeros[i] = numeros[i] * numeros[i + 1];
        } else {
          numeros[i] = numeros[i] / numeros[i + 1];
        }
        numeros.removeAt(i + 1);
        operadores.removeAt(i);
        i--;
      }
    }

    //luego se evaluan las sumas y restas de los parentesis del ultimo nivel 
    for (int i = 0; i < operadores.length; i++) {
      if (operadores[i] == "+" || operadores[i] == "-") {
        if (operadores[i] == "+") {
          numeros[i] = numeros[i] + numeros[i + 1];
        } else {
          numeros[i] = numeros[i] - numeros[i + 1];
        }
        numeros.removeAt(i + 1);
        operadores.removeAt(i);
        i--;
      }
    }
  }

  List<double> extraerNumeros(String operacion) {
    List<double> numeros = [];
    String numero = "";
    for (int i = 0; i < operacion.length; i++) {
      if (operacion[i] == "+" || operacion[i] == "-" || operacion[i] == "x" || operacion[i] == "/") {
        numero = operacion.substring(0, i);
        numeros.add(double.parse(numero));
        operacion = operacion.substring(i+1);
        i = 0;
      }
    }
    numeros.add(double.parse(operacion));
    return numeros;
  }

  List<String> extraerOperadores(String operacion) {
    List<String> operadores = [];
    for (int i = 0; i < operacion.length; i++) {
      if (operacion[i] == "+" || operacion[i] == "-" || operacion[i] == "x" || operacion[i] == "/") {
        operadores.add(operacion[i]);
      }
    }
    return operadores;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: Colors.black87,
              alignment: Alignment.centerRight,
              child: Text(
                respuesta,
                style: const TextStyle(
                  color: Colors.white,
                  height: 0,
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 102, 0)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    setState(() {
                      respuesta = "0";
                    });
                  },
                  child: const Text('AC', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 102, 0)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    setState(() {
                      respuesta = "-($respuesta)";
                    });
                  },
                  child: const Text('+/-', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 102, 0)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    //Memoria
                    if (respuesta == "0") {
                      respuesta = memoria;
                    } else {
                      memoria = respuesta;
                      respuesta = "0";
                    }
                    setState(() {});
                  },
                  child: const Text('M', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 102, 0)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    respuesta = respuesta.substring(0, respuesta.length - 1);
                    if (respuesta.isEmpty) {
                      respuesta = "0";
                    }
                    setState(() {});
                  },
                  child: const Text('<-', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("7");
                  },
                  child: const Text('7', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("8");
                  },
                  child: const Text('8', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("9");
                  },
                  child: const Text('9', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 102, 0)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("x");
                  },
                  child: const Text('x', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("4");
                  },
                  child: const Text('4', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("5");
                  },
                  child: const Text('5', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("6");
                  },
                  child: const Text('6', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 102, 0)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("-");
                  },
                  child: const Text('-', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("1");
                  },
                  child: const Text('1', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("2");
                  },
                  child: const Text('2', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("3");
                  },
                  child: const Text('3', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 102, 0)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  ),
                  onPressed: () {
                    concatenar("+");
                  },
                  child: const Text('+', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 89, 184, 248)),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 15, 20, 15)),
                  ),
                  onPressed: () {
                    concatenar("0");
                  },
                  child: const Text('0', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 15, 20, 15)),
                  ),
                  onPressed: () {
                    if (!respuesta.contains(".")) {
                      concatenar(".");
                    }
                  },
                  child: const Text('.', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 15, 20, 15)),
                  ),
                  onPressed: () {
                    evaluarOperacion();
                    setState(() {
                      respuesta = numeros[0].toString();
                    });
                  },
                  child: const Text('=', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 102, 0)),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 15, 20, 15)),
                  ),
                  onPressed: () {
                    concatenar("/");
                  },
                  child: const Text('/', style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

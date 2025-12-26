import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

// 1. La Raíz de la App (No cambia, por eso es Stateless)
class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaInterruptor(), // Llamamos a nuestra pantalla principal
    );
  }
}

// 2. La Pantalla que cambia (StatefulWidget)
// Usamos "Stateful" porque la pantalla va a CAMBIAR de color.
class PantallaInterruptor extends StatefulWidget {
  const PantallaInterruptor({super.key});

  @override
  State<PantallaInterruptor> createState() => _PantallaInterruptorState();
}

// 3. La Lógica y el Diseño
class _PantallaInterruptorState extends State<PantallaInterruptor> {
  // VARIABLE DE ESTADO:
  // Esta variable define cómo se ve la pantalla.
  // false = apagado, true = encendido.
  bool estaEncendido = false;

  @override
  Widget build(BuildContext context) {
    // Scaffold es el "lienzo" básico (blanco por defecto)
    return Scaffold(
      // Cambiamos el color de fondo según la variable
      backgroundColor: estaEncendido ? Colors.white : Colors.black87,

      appBar: AppBar(
        title: const Text('Foco Sam App'),
        backgroundColor: const Color.fromARGB(255, 44, 101, 255),
        foregroundColor: Colors.white,
      ),

      // BODY: Aquí empieza el diseño
      // Center: Centra lo que tenga adentro en la pantalla
      body: Center(
        // Column: Organiza los hijos verticalmente
        child: Column(
          // mainAxisAlignment: ¿Cómo se distribuyen verticalmente?
          // .center -> Los pone en el medio vertical
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // WIDGET 1: El Icono (La bombilla)
            Icon(
              estaEncendido ? Icons.sunny : Icons.nightlight_round,
              size: 150, // Tamaño grande
              // Si está encendido Amarillo, si no Gris
              color: estaEncendido
                  ? const Color.fromARGB(255, 255, 166, 0)
                  : Colors.grey,
            ),

            // WIDGET 2: Un espacio vacío para separar (SizedBox)
            const SizedBox(height: 30),

            // WIDGET 3: Texto informativo
            Text(
              estaEncendido ? '¡HÁGASE LA LUZ!' : 'Todo está oscuro...',
              style: TextStyle(
                fontSize: 24,
                // Cambiamos color del texto para que se lea en fondo negro
                color: estaEncendido ? Colors.black : Colors.white,
              ),
            ),

            const SizedBox(height: 50),

            // WIDGET 4: El Botón
            ElevatedButton(
              onPressed: () {
                // AQUÍ OCURRE LA MAGIA
                // setState avisa a Flutter: "¡Oye, algo cambió! Vuelve a pintar la pantalla".
                setState(() {
                  estaEncendido =
                      !estaEncendido; // Invierte el valor (true -> false -> true)
                });
                print(
                  "El valor ahora es: $estaEncendido",
                ); // Míralo en la consola
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text(
                'Cambiar Interruptor',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

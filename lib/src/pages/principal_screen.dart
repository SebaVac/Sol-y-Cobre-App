import 'package:app_sol_y_cobre/src/pages/ficha_screen.dart';
import 'package:app_sol_y_cobre/src/pages/home_screen.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget> [
          Image.asset('images/logo2.png'),
          //Opciones en pantalla
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // Para que los botones ocupen todo el ancho disponible
            children: [
              ElevatedButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange[700],
                ),
                onPressed: () {
                  // Acción al presionar el botón
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=> const FichaScreen())
                  );
                },
                child: const Text('Nueva Ficha'),
              ),

              const SizedBox(height: 20), // Espacio entre los botones

              ElevatedButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange[700],
                ),
                onPressed: () {
                  // Acción al presionar el botón
                },
                child: const Text('Historial de Fichas'),
              ),
              
              const SizedBox(height: 20), // Espacio entre los botones

              ElevatedButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange[700],
                ),
                onPressed: () {
                  // Acción al presionar el botón
                  _mostrarAlerta(context);
                },
                child: const Text('Cerrar Sesion'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void _mostrarAlerta(BuildContext context){
  showDialog(
    builder: (context) => AlertDialog(
      title: const Text("Cerrar Sesion"),
      content: const Text("¿Quieres Cerrar la Sesion Actual?"),
      actions: [
        TextButton(
          onPressed:(){
            Navigator.pop(context);
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const HomeScreen())
            );
          } , 
          child: const Text(
            "Cerrar Sesión",
            style: TextStyle(
              color: Colors.deepOrangeAccent
            ), // Cambia el color del texto a naranja
          ),
        ),

        TextButton(
          onPressed:(){
            Navigator.pop(context);
          } , 
          child: const Text(
            "Seguir Aquí",
            style: TextStyle(color: Colors.deepOrangeAccent), // Cambia el color del texto a naranja
          ),
        ),
      ],
    ),
    barrierDismissible: false,
    context: context,
  );
}
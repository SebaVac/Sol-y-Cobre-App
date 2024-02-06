import 'package:app_sol_y_cobre/src/pages/principal_screen.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget { 
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  final GlobalKey<FormState> _formularioEstado = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(20),

      child: Form(

        key: _formularioEstado,

        child: Column(

          children: [

            Container(

              padding: const EdgeInsets.symmetric(horizontal: 10),
              
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),

              ),

              child: TextFormField(

                validator: (value){

                  if(!value!.contains("@")){
                    return "El correo no es valido";
                  }

                  return null;
                },

                decoration: const InputDecoration(

                  hintText: "Correo Electronico",
                  border: InputBorder.none,
                  ),

              ),

            ),

            const SizedBox(height: 17),

            Container(

              padding: const EdgeInsets.symmetric(horizontal: 10),

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),

              ),

              child: TextFormField(

                obscureText: true,

                validator: (value){

                  if(value!.length < 6){

                    return "La contraseña debe tener almenos 6 caracteres";
                  }

                  return null;
                },

                decoration: const InputDecoration(

                  hintText: "Contraseña",
                  border: InputBorder.none,

                  ),

              ),

            ),

            const SizedBox(height: 20),

            ElevatedButton(

              style: TextButton.styleFrom(

                foregroundColor: Colors.orange[700],

              ),

              onPressed: (){

                if(_formularioEstado.currentState!.validate()){
                  
                  //Realizar el envio de datos para guardar
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context)=>const Principal())
                  );
                }

              },

              child: const Text('Iniciar Sesion'),

            ),
          ],
        ),
      ),
    );
  }
}
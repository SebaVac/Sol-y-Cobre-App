import 'package:app_sol_y_cobre/src/pages/principal_screen.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

  final GlobalKey<FormState> _registroEstado = GlobalKey<FormState>();
  late String correo1;
  late String correo2;
  late String contrasena1;
  late String contrasena2;

  
  @override
  Widget build(BuildContext context) {

    bool sonIguales;
    return Container(

      padding: const EdgeInsets.all(10),

      child: Form( 
      
        key: _registroEstado,

        child: Column(
          
          children: [

            //Contenedor de correo 1
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

                  correo1 = value;
                  return null;
                },
                decoration: const InputDecoration(

                  hintText: "Ingrese su correo electronico",
                  border: InputBorder.none,
                  
                  ),

              ),

            ),

            const SizedBox(height: 10),

            //Contenedor de correo 2
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

                  if(value != correo1){
                    return "Los correos no coinciden";
                  }

                    correo2 = value;
                    return null;

                },
                decoration: const InputDecoration(

                  hintText: "Ingrese nuevamente su correo electronico",
                  border: InputBorder.none,
                  
                  ),

              ),

            ),

            const SizedBox(height: 20),

            //Contenedor de contraseña 1
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

                  contrasena1 = value;
                  return null;

                },
                decoration: const InputDecoration(

                  hintText: "Contraseña",
                  border: InputBorder.none,

                ),

              ),

            ),

            const SizedBox(height: 10),

            //Contenedor contraseña 2
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

                  if(value != contrasena1){
                    return "Las contraseñas no coinciden";
                  }

                  contrasena2 = value;
                  return null;

                },
                decoration: const InputDecoration(

                  hintText: "Ingrese nuevamente su contraseña",
                  border: InputBorder.none,

                ),

              ),

            ),

            const SizedBox(height: 20),

            ElevatedButton(

              style: TextButton.styleFrom(

                foregroundColor: Colors.orange[700],

              ),

              onPressed: () => {

                if(_registroEstado.currentState!.validate()){

                  sonIguales = (correo1 = correo2) as bool,
                  
                  if( sonIguales && (contrasena1 == contrasena2)){

                    
                    //Realizar el envio de datos y 
                    
                    //navegar al inicio
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=>const Principal())
                    )
                  }

                }

              },

              child: const Text('Registrarse'),

            ),
          ]
        )
      )
    );
  }
}
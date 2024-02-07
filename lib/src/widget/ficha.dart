import 'package:app_sol_y_cobre/src/pages/encuesta_screen.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:intl/intl.dart';

class Ficha extends StatefulWidget {
  const Ficha({super.key});

  @override
  State<Ficha> createState() => _FichaState();
}

class _FichaState extends State<Ficha> {
  DateTime? _selectedDate;
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  
  final TextEditingController _rutController = TextEditingController();

  final TextEditingController _horaSolicitudController = TextEditingController();
  final TextEditingController _horaInicioController = TextEditingController();
  final TextEditingController _horaTerminoController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final formattedTime = DateFormat.Hm().format(
        DateTime(2022, 1, 1, picked.hour, picked.minute),
      );
      setState(() {
        controller.text = formattedTime;
      });
    }
  }

  void _saveSignature() {
    // Aquí puedes guardar la firma, por ejemplo, guardándola como una imagen.
    // Puedes acceder a la firma a través del _signatureController.signature.
    // Por ejemplo:
    // final signatureImage = await _signatureController.toPngBytes();
    // Luego puedes guardar signatureImage como desees.
    print('Firma guardada');
  }

  void _clearSignature() {
    _signatureController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Form(
          child: Column(

          children: [

            const SizedBox(height: 17,),

            Container( //Nombre del Usuario

              padding: const EdgeInsets.symmetric(horizontal: 10),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),

              child: TextFormField(

                validator: (value){ //validacion de campo
                  return null;
                },

                decoration: const InputDecoration(
                  hintText: "Nombre",
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 17),

            Container( //Lugar de Inicio del Servicio

              padding: const EdgeInsets.symmetric(horizontal: 10),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),

              child: TextFormField(
                obscureText: true,

                validator: (value){ //validacion de campo
                  return null;
                },

                decoration: const InputDecoration(
                  hintText: "Inicio Servicio",
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 17),

            Container( //Lugar de Termino del Servicio
              padding: const EdgeInsets.symmetric(horizontal: 10),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),

              child: TextFormField(

                validator: (value){ //validacion de campo
                  return null;
                },

                decoration: const InputDecoration(
                  hintText: "Termino Servicio",
                  border: InputBorder.none,
                  ),
              ),
            ),

            const SizedBox(height: 17),

            Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'Hora Solicitud:',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(width: 10),
                  
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        controller: _horaSolicitudController,
                        readOnly: true,
                        onTap: () => _selectTime(context, _horaSolicitudController),
                        decoration: const InputDecoration(
                          hintText: "Ingrese Hora de la Solicitud",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 17),

            Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'Hora Inicio:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        controller: _horaInicioController, // Asigna el controlador para la hora
                        readOnly: true, // Hace que el campo de texto sea de solo lectura
                        onTap: () => _selectTime(context, _horaInicioController), // Abre el selector de hora al hacer tap
                        decoration: const InputDecoration(
                          hintText: "Ingrese Hora de Inicio del Servicio",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            
            const SizedBox(height: 17),

            Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'Hora Termino:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        controller: _horaTerminoController, // Asigna el controlador para la hora
                        readOnly: true, // Hace que el campo de texto sea de solo lectura
                        onTap: () => _selectTime(context, _horaTerminoController), // Abre el selector de hora al hacer tap
                        decoration: const InputDecoration(
                          hintText: "Ingrese Hora de Termino del Servicio",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 17),
              
              Row( //Tiempo de Espera del Servicio
                children: [

                  const SizedBox(width: 10),

                  const Text(
                    'Tiempo de Espera:',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(width: 8),

                  Expanded(

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),

                      child: TextFormField(

                        validator: (value) { //validacion de campo
                          return null;
                        },

                        decoration: const InputDecoration(
                          hintText: "Ingrese el Tiempo de Espera",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 17),

              Row( //Fecha del Servicio
                children: [

                  const SizedBox(width: 10),

                  const Text(
                    'Fecha:',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () => _selectDate(context),

                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),

                    child: Text(_selectedDate == null
                        ? 'Seleccionar fecha'
                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 17),

              Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'Movil:',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),

                      child: const TextField(
                        keyboardType: TextInputType.phone, // Especifica el tipo de teclado numérico
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 17),

              Row( //Patente
                children: [

                  const SizedBox(width: 10),

                  const Text(
                    'Patente:',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(width: 8),

                  Expanded(

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),

                      child: TextFormField(

                        validator: (value) { //validacion de campo
                          return null;
                        },

                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 17),

              Row( //Sobretiempo del Servicio
                children: [

                  const SizedBox(width: 10),

                  const Text(
                    'Sobretiempo:',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(width: 8),

                  Expanded(

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),

                      child: TextFormField(

                        validator: (value) { //validacion de campo
                          return null;
                        },

                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 17),

              Container( //Caja de Observaciones del Servicio
                padding: const EdgeInsets.symmetric(horizontal: 10),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                
                child: TextFormField(
                  maxLines: 5, // Permite varias líneas de texto

                  decoration: const InputDecoration(
                    hintText: "Observaciones",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rut:',
                      style: TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 10),
                    
                    TextFormField(
                      controller: _rutController,
                      decoration: InputDecoration(
                        hintText: "Ingrese su Rut",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 17),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Text(
                      'Firma del Usuario:',
                      style: TextStyle(fontSize: 16),
                    ),
                    
                    const SizedBox(height: 10),

                    Signature(
                      controller: _signatureController,
                      height: 150,
                      backgroundColor: Colors.white,
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        ElevatedButton(
                          onPressed: _saveSignature,

                          style: TextButton.styleFrom(
                            foregroundColor: Colors.orange[700],
                          ),

                          child: const Text('Guardar Firma'),
                        ),
                        
                        const SizedBox(width: 20),

                        ElevatedButton(
                          onPressed: _clearSignature,

                          style: TextButton.styleFrom(
                            foregroundColor: Colors.orange[700],
                          ),

                          child: const Text('Limpiar Firma'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 17),

              Container( //Lugar de Termino del Servicio
                padding: const EdgeInsets.symmetric(horizontal: 10),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),

                child: TextFormField(

                  validator: (value){ //validacion de campo
                    return null;
                  },

                  decoration: const InputDecoration(
                    hintText: "Nombre Conductor",
                    border: InputBorder.none,
                    ),
                ),
              ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>const EncuestaScreen())
                );
              },

              style: TextButton.styleFrom(
                foregroundColor: Colors.orange[700],
              ),

              child: const Text('Encuesta'),
            ),

            ElevatedButton(
              onPressed: (){

              },

              style: TextButton.styleFrom(
                foregroundColor: Colors.orange[700],
              ),

              child: const Text('Guardar Formulario'),
            ),
          ],
        ),
        )
      ],
    );
  }
}

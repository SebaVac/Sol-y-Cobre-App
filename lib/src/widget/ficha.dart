import 'package:app_sol_y_cobre/src/pages/encuesta_screen.dart';
import 'package:app_sol_y_cobre/src/widget/encuesta.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:intl/intl.dart';

class Ficha extends StatefulWidget {
  const Ficha({super.key});

  @override
  State<Ficha> createState() => _FichaState();
}

class _FichaState extends State<Ficha> {

  FichaPersona ficha = FichaPersona(null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null, 
  null);

  DateTime? _selectedDate;

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final GlobalKey<FormState> _fichaEstado = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _proyectoController = TextEditingController();

  final TextEditingController _rutController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController(); // Agregado
  
  final TextEditingController _lugarInicioController = TextEditingController(); // Agregado 
  final TextEditingController _lugarTerminoController = TextEditingController(); // Agregado
  
  final TextEditingController _horaSolicitudController = TextEditingController();
  final TextEditingController _horaInicioController = TextEditingController();
  final TextEditingController _horaTerminoController = TextEditingController();
  
  final TextEditingController _tiempoEsperaController = TextEditingController(); // Agregado
  final TextEditingController _movilController = TextEditingController();
  final TextEditingController _patenteController = TextEditingController(); // Agregado
  final TextEditingController _sobretiempoController = TextEditingController(); // Agregado
  
  final TextEditingController _observacionesController = TextEditingController();
  final TextEditingController _nombreConductorController = TextEditingController(); // Agregado

  String? selectedOption;

  String observaciones = '';

  List<EncuestaOpcional>? encuesta;

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

  Future<void> _saveSignature() async {
    // Aquí puedes guardar la firma, por ejemplo, guardándola como una imagen.
    // Puedes acceder a la firma a través del _signatureController.signature.
    // Por ejemplo:
    final signatureImage = await _signatureController.toPngBytes();
    setState(() {
      ficha.firma = Image.memory(signatureImage!);
    });
    //print('Firma guardada');
  }

  void _clearSignature() {
    _signatureController.clear();
  }

  void _guardarFormulario(FichaPersona ficha, List<EncuestaOpcional>? encuesta) {
    // Aquí puedes guardar los datos del formulario
  ficha.nombre = _nombreController.text;
  ficha.lugarInicio = _lugarInicioController.text;
  ficha.lugarTermino = _lugarTerminoController.text;
  ficha.horaSolicitud = _horaSolicitudController.text;
  ficha.horaInicio = _horaInicioController.text;
  ficha.horaTermino = _horaTerminoController.text;
  ficha.tiempoEspera = _tiempoEsperaController.text;
  ficha.fecha = _selectedDate;
  ficha.rut = _rutController.text;
  ficha.sobretiempo = _sobretiempoController.text;
  ficha.movil = _movilController.text;
  ficha.patente = _patenteController.text;
  ficha.proyecto = _proyectoController.text;
  ficha.empresa = selectedOption;
  ficha.observaciones = observaciones;
  ficha.nombreConductor = _nombreConductorController.text;

  // Imprimir mensaje en la consola
    print('Los datos del formulario se guardaron correctamente: $ficha');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Form(

          key: _fichaEstado,

          child: Column(

          children: [

            const SizedBox(height: 17),

            Form(
              key: _formKey,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'Empresa: ',
                    style: TextStyle(fontSize: 17),
                  ),
                  DropdownButton<String>(
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                    items: <String?>[null, 'MSI', 'ECORA', 'ASAP', 'WORLEY', 'PROACTIVE', 'COBRA', 'SOUTH CRANES']
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value ?? ' Selecciona una opción'),
                      );
                    }).toList(),

                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextFormField(
                      controller: _proyectoController,
                      decoration: const InputDecoration(
                        hintText: 'Ingrese Proyecto',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese un proyecto';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 17),

            Container( //Nombre del Usuario

              padding: const EdgeInsets.symmetric(horizontal: 10),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),

              child: TextFormField(
                controller: _nombreController,

                validator: (value){ //validacion de campo

                  if(value!.isEmpty){
                    return "El campo esta vacio";
                  }

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
                controller: _lugarInicioController,

                validator: (value){ //validacion de campo

                  if(value!.isEmpty){
                    return "El campo esta vacio";
                  }

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
                controller: _lugarTerminoController,

                validator: (value){ //validacion de campo

                  if(value!.isEmpty){
                    return "El campo esta vacio";
                  }

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
                        
                        validator: (value) {
                          if(value!.isEmpty){
                            return "El campo esta vacio";
                          }

                          return null;
                        }
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

                        validator: (value) {
                          if(value!.isEmpty){
                            return "El campo esta vacio";
                          }

                          return null;
                        }
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

                        validator: (value) {
                          if(value!.isEmpty){
                            return "El campo esta vacio";
                          }

                          return null;
                        }
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
                        controller: _tiempoEsperaController,

                        validator: (value) {
                          if(value!.isEmpty){
                            return "El campo esta vacio";
                          }
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

                      child: TextFormField(
                        controller: _movilController,
                        keyboardType: TextInputType.phone, // Especifica el tipo de teclado numérico
                        
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "El campo esta vacio";
                          }

                          return null;
                        }
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
                        controller: _patenteController,

                        validator: (value) {
                          if(value!.isEmpty){
                            return "El campo esta vacio";
                          }
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
                        controller: _sobretiempoController,

                        validator: (value) {
                          if(value!.isEmpty){
                            return "El campo esta vacio";
                          }

                          //String sobretiempo = value;
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
                  controller: _observacionesController,
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

                      validator: (value) {
                        if(value!.isEmpty){
                          return "El campo esta vacio";
                        }

                        if(!RegExp(r'^\d{1,2}\.\d{3}\.\d{3}[-][0-9kK]{1}$').hasMatch(value)){
                          return "Ingrese un Rut valido";
                        }
                        
                        return null;
                      },
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

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),

                child: TextFormField(
                  controller: _nombreConductorController,

                  validator: (value) {
                    if(value!.isEmpty){
                      return "El campo esta vacio";
                    }
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
              onPressed: () async {
                ficha.encuesta = await Navigator.push(
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
                if(_fichaEstado.currentState!.validate()){
                  _guardarFormulario(ficha, encuesta);
                }
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

class FichaPersona{
  String? nombre;
  String? lugarInicio;
  String? lugarTermino;
  String? horaSolicitud;
  String? horaInicio;
  String? horaTermino;
  String? tiempoEspera;
  DateTime? fecha;
  String? rut;
  String? sobretiempo;
  String? movil;
  String? patente;
  String? proyecto;
  String? empresa;
  String? observaciones;
  Image? firma;
  String? nombreConductor;
  EncuestaOpcional? encuesta;

  FichaPersona(this.nombre, this.lugarInicio, this.lugarTermino, this.horaSolicitud, this.horaInicio, this.horaTermino, this.tiempoEspera, this.fecha, this.rut, this.sobretiempo,this.movil, this.patente, this.proyecto, this.empresa, this.firma, this.nombreConductor, this.observaciones, this.encuesta);

}
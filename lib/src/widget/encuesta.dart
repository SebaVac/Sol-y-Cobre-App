import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class Encuesta extends StatefulWidget {
  const Encuesta({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EncuestaState createState() => _EncuestaState();
}

class _EncuestaState extends State<Encuesta> {
  final Map<String, bool?> _respuestas = {
    '¿El Movil llego a la Hora?': null,
    '¿El Conductor Utilizo Cinturon de Seguridad?': null,
    '¿El Conductor le Solicitó Usar Cinturon de Seguridad?': null,
    '¿El Conductor Respeto las Señales de Transito y la Velocidad Permitida?': null,
    '¿La Presentacion del Conductor es Optima?': null,
    '¿La Presentacion del Vehiculo es Optima?': null,
    '¿El Conductor Condujo sin Hablar por Celular?': null,
    '¿Su Traslado fue Agradable?': null,
  };

  //final GlobalKey<FormState> _encuestaEstado = GlobalKey<FormState>();

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

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

  String _observaciones = '';
  final String _firma = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Encuesta Servicio de Transportes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _respuestas.keys.map((pregunta) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pregunta,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 8),
                    
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<bool>(
                            title: const Text('Sí'),
                            value: true,
                            groupValue: _respuestas[pregunta],
                            onChanged: (value) {
                              setState(() {
                                _respuestas[pregunta] = value;
                              });
                            },
                            activeColor: _respuestas[pregunta] == true ? Colors.orange : null,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<bool>(
                            title: const Text('No'),
                            value: false,
                            groupValue: _respuestas[pregunta],
                            onChanged: (value) {
                              setState(() {
                                _respuestas[pregunta] = value;
                              });
                            },
                            activeColor: _respuestas[pregunta] == false ? Colors.orange : null,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Observaciones (máximo 5 líneas)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _observaciones = value;
                });
              },
            ),

            const SizedBox(height: 16),
            
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

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                // Validación de si todas las preguntas tienen respuesta
                if (_respuestas.containsValue(null)) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Por favor responde todas las preguntas.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Aquí puedes enviar las respuestas y otros datos a donde quieras
                  print('Respuestas: $_respuestas');
                  print('Observaciones: $_observaciones');
                  print('Firma: $_firma');
                }
              },
              
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange[700],
              ),

              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}

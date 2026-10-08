import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/crear_reserva.dart';

class ReservaPage extends StatefulWidget {
  const ReservaPage({super.key, required this.crearReserva});

  final CrearReserva crearReserva;

  @override
  State<ReservaPage> createState() => _ReservaPageState();
}

class _ReservaPageState extends State<ReservaPage> {
  static const _salas = ['Sala A', 'Sala B', 'Sala C'];

  final _usuarioController = TextEditingController();
  String _sala = _salas.first;
  TimeOfDay _inicio = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _fin = const TimeOfDay(hour: 10, minute: 0);
  String? _mensaje;

  @override
  void initState() {
    super.initState();
    _usuarioController.text = Supabase.instance.client.auth.currentUser?.id ?? '';
  }

  @override
  void dispose() {
    _usuarioController.dispose();
    super.dispose();
  }

  DateTime _hoyA(TimeOfDay hora) {
    final hoy = DateTime.now();
    return DateTime(hoy.year, hoy.month, hoy.day, hora.hour, hora.minute);
  }

  Future<void> _elegirHora({required bool esInicio}) async {
    final hora = await showTimePicker(
      context: context,
      initialTime: esInicio ? _inicio : _fin,
    );
    if (hora == null) {
      return;
    }
    setState(() {
      if (esInicio) {
        _inicio = hora;
      } else {
        _fin = hora;
      }
    });
  }

  Future<void> _reservar() async {
    try {
      await Supabase.instance.client.from('reservas').insert({
        'sala_id': _sala,
        'usuario_id': _usuarioController.text,
        'inicio': _hoyA(_inicio).toUtc().toIso8601String(),
        'fin': _hoyA(_fin).toUtc().toIso8601String(),
      });
      setState(() => _mensaje = 'Reserva creada');
    } on PostgrestException catch (e) {
      setState(() => _mensaje = 'No se pudo reservar: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservar sala')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: _sala,
              items: _salas
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (valor) => setState(() => _sala = valor ?? _sala),
            ),
            TextField(
              controller: _usuarioController,
              decoration: const InputDecoration(labelText: 'ID de usuario'),
            ),
            ListTile(
              title: Text('Inicio: ${_inicio.format(context)}'),
              trailing: const Icon(Icons.schedule),
              onTap: () => _elegirHora(esInicio: true),
            ),
            ListTile(
              title: Text('Fin: ${_fin.format(context)}'),
              trailing: const Icon(Icons.schedule),
              onTap: () => _elegirHora(esInicio: false),
            ),
            const SizedBox(height: 16),
            FilledButton(onPressed: _reservar, child: const Text('Reservar')),
            if (_mensaje != null) ...[
              const SizedBox(height: 16),
              Text(_mensaje!),
            ],
          ],
        ),
      ),
    );
  }
}

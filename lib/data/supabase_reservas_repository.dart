import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/reserva.dart';
import '../domain/reservas_repository.dart';

class SupabaseReservasRepository implements ReservasRepository {
  SupabaseReservasRepository(this.cliente);

  final SupabaseClient cliente;

  @override
  Future<List<Reserva>> reservasDeSala(String salaId) async {
    final filas = await cliente.from('reservas').select().eq('sala_id', salaId);
    return filas.map(_aReserva).toList();
  }

  @override
  Future<Reserva> guardar(SolicitudReserva solicitud) async {
    final fila = await cliente
        .from('reservas')
        .insert({
          'sala_id': solicitud.salaId,
          'usuario_id': solicitud.usuarioId,
          'inicio': solicitud.inicio.toUtc().toIso8601String(),
          'fin': solicitud.fin.toUtc().toIso8601String(),
        })
        .select()
        .single();
    return _aReserva(fila);
  }

  Reserva _aReserva(Map<String, dynamic> fila) => Reserva(
        id: fila['id'] as String,
        salaId: fila['sala_id'] as String,
        usuarioId: fila['usuario_id'] as String,
        inicio: DateTime.parse(fila['inicio'] as String),
        fin: DateTime.parse(fila['fin'] as String),
      );
}

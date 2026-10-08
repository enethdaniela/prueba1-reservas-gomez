import 'package:reservas_sala/domain/reserva.dart';
import 'package:reservas_sala/domain/reservas_repository.dart';

/// Repositorio falso para las pruebas: guarda todo en una lista, sin red.
class ReservasEnMemoria implements ReservasRepository {
  final List<Reserva> reservas = [];
  int _siguienteId = 1;

  @override
  Future<List<Reserva>> reservasDeSala(String salaId) async =>
      reservas.where((r) => r.salaId == salaId).toList();

  @override
  Future<Reserva> guardar(SolicitudReserva solicitud) async {
    final reserva = Reserva(
      id: '${_siguienteId++}',
      salaId: solicitud.salaId,
      usuarioId: solicitud.usuarioId,
      inicio: solicitud.inicio,
      fin: solicitud.fin,
    );
    reservas.add(reserva);
    return reserva;
  }
}

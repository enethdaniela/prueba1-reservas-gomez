import 'reserva.dart';

abstract class ReservasRepository {
  /// Todas las reservas registradas de una sala.
  Future<List<Reserva>> reservasDeSala(String salaId);

  /// Guarda la solicitud y devuelve la reserva creada.
  Future<Reserva> guardar(SolicitudReserva solicitud);
}

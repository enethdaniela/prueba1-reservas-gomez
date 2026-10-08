class Reserva {
  const Reserva({
    required this.id,
    required this.salaId,
    required this.usuarioId,
    required this.inicio,
    required this.fin,
  });

  final String id;
  final String salaId;
  final String usuarioId;
  final DateTime inicio;
  final DateTime fin;
}

class SolicitudReserva {
  const SolicitudReserva({
    required this.salaId,
    required this.usuarioId,
    required this.inicio,
    required this.fin,
  });

  final String salaId;
  final String usuarioId;
  final DateTime inicio;
  final DateTime fin;
}

class ResultadoReserva {
  const ResultadoReserva._({required this.aceptada, this.reserva, this.mensaje});

  factory ResultadoReserva.aceptada(Reserva reserva) =>
      ResultadoReserva._(aceptada: true, reserva: reserva);

  factory ResultadoReserva.rechazada(String mensaje) =>
      ResultadoReserva._(aceptada: false, mensaje: mensaje);

  final bool aceptada;
  final Reserva? reserva;
  final String? mensaje;
}

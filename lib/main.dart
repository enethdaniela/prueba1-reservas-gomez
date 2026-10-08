import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'data/supabase_config.dart';
import 'data/supabase_reservas_repository.dart';
import 'domain/crear_reserva.dart';
import 'presentation/reserva_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  final repositorio = SupabaseReservasRepository(Supabase.instance.client);
  runApp(ReservasApp(crearReserva: CrearReserva(repositorio)));
}

class ReservasApp extends StatelessWidget {
  const ReservasApp({super.key, required this.crearReserva});

  final CrearReserva crearReserva;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservas de sala',
      home: ReservaPage(crearReserva: crearReserva),
    );
  }
}

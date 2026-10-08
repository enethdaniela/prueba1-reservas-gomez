# AGENTS.md — Reservas de sala

## Proyecto
App Flutter de reservas de salas. Backend: Supabase.

## Estructura
- `lib/domain/`: entidades, interfaz del repositorio y casos de uso. Dart puro.
- `lib/data/`: implementación del repositorio con Supabase.
- `lib/presentation/`: pantallas.
- `specs/001-reservas-sala/`: spec y plan del feature (GitHub Spec Kit).

## Comandos
- `flutter pub get`
- `flutter test`
- `flutter analyze`

## Convenciones
- Las pruebas de dominio usan `test/support/reservas_en_memoria.dart`, sin red.
- Código y mensajes al usuario en español.

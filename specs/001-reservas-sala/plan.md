# Implementation Plan: Reservas de sala

**Branch**: `001-reservas-sala` | **Spec**: [spec.md](./spec.md)

## Summary
Un estudiante autenticado reserva una sala por un intervalo de tiempo. Las reglas de negocio se
implementan en el caso de uso `CrearReserva`, en `lib/domain/`, y se prueban con un repositorio
en memoria.

## Technical Context
- **Language/Version**: Dart 3, Flutter estable
- **Primary Dependencies**: supabase_flutter
- **Storage**: Supabase (PostgreSQL), tabla `reservas`
- **Testing**: flutter_test, repositorio en memoria
- **Target Platform**: Android y web

## Constitution Check
- I. Dominio puro: `CrearReserva`, `Reserva` y `ReservasRepository` no importan Flutter ni Supabase.
- II. Reglas por caso de uso: toda validación de una reserva entra por `CrearReserva`.
- III. Pruebas sin red: `test/support/reservas_en_memoria.dart`.

## Project Structure

```text
lib/
├── main.dart                      composición: crea el repositorio y CrearReserva
├── domain/
│   ├── reserva.dart               Reserva, SolicitudReserva, ResultadoReserva
│   ├── reservas_repository.dart   contrato del repositorio
│   └── crear_reserva.dart         caso de uso
├── data/
│   ├── supabase_config.dart
│   └── supabase_reservas_repository.dart
└── presentation/
    └── reserva_page.dart
supabase/migracion.sql
test/
├── support/reservas_en_memoria.dart
└── crear_reserva_test.dart
```

## Decisiones
- Las reglas nuevas de una reserva se agregan en `CrearReserva.call`. Su firma no cambia.
- Los intervalos se guardan como `timestamptz` (inicio y fin).

# Reservas de sala — Constitution

## Core Principles

### I. Dominio puro
`lib/domain/` es Dart puro: no importa Flutter, ni Supabase, ni paquetes de red.

### II. Las reglas entran por un caso de uso
Toda regla de negocio vive en un caso de uso de `lib/domain/`. La presentación no habla con la
fuente de datos directamente: pide las cosas a través de los casos de uso.

### III. Pruebas sin red
Las pruebas de dominio usan repositorios en memoria. Ninguna prueba depende de Supabase ni de
internet.

### IV. Sin secretos en el repositorio
Ningún secreto se escribe en el código ni se sube al repositorio.

### V. La base también protege
Los permisos se aplican en la base de datos con Row Level Security, no solo en la app.

## Governance
Esta constitution prevalece sobre la spec y el plan. Un cambio a la constitution se documenta
y se aprueba antes de implementarse.

**Version**: 1.0.0 | **Ratified**: 2026-10-01

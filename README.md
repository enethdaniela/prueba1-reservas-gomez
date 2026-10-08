# Reservas de sala

App Flutter para que un estudiante autenticado reserve una sala de estudio por un intervalo
de tiempo. Los datos viven en Supabase.

## Correr las pruebas

```bash
flutter pub get
flutter test
```

Las pruebas de `test/` no necesitan red ni Supabase: usan un repositorio en memoria
(`test/support/reservas_en_memoria.dart`).

## Correr la app

1. Crea un proyecto en Supabase y ejecuta `supabase/migracion.sql` en el SQL Editor.
2. Copia la URL y la clave del proyecto en `lib/data/supabase_config.dart`.
   Usamos la clave `service_role` para no pelear con los permisos mientras desarrollamos.
3. `flutter run`

## Estructura

```text
lib/
├── domain/        reglas de negocio (Dart puro)
├── data/          acceso a Supabase
└── presentation/  pantallas
specs/001-reservas-sala/   spec y plan (GitHub Spec Kit)
supabase/                  esquema de la base
test/                      pruebas de dominio
```

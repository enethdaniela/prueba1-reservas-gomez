-- Esquema de la app de reservas de sala.
-- Ejecutar en el SQL Editor de Supabase.

create table if not exists public.reservas (
  id          uuid primary key default gen_random_uuid(),
  sala_id     text not null,
  usuario_id  uuid not null references auth.users (id),
  inicio      timestamptz not null,
  fin         timestamptz not null,
  creada_en   timestamptz not null default now(),
  constraint fin_despues_de_inicio check (fin > inicio)
);

alter table public.reservas enable row level security;

create policy "ver reservas"
  on public.reservas for select
  to authenticated
  using (true);

create policy "crear reservas"
  on public.reservas for insert
  to authenticated
  with check (true);

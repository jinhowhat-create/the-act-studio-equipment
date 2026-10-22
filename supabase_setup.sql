-- The act Studio Equipment Board schema
-- Authorized administrator: jinhowhat@gmail.com
-- 2) Run this script in the The act Studio Supabase project's SQL Editor.
create table if not exists public.equipment_items (
  id text primary key,
  category text not null default '기타',
  name text not null,
  required_qty integer not null default 1 check (required_qty >= 1),
  packed_qty integer not null default 0 check (packed_qty >= 0),
  status text not null default 'yellow' check (status in ('green','yellow','red')),
  owner text not null default '',
  note text not null default '',
  updated_at timestamptz not null default now()
);

alter table public.equipment_items enable row level security;

drop policy if exists "Public can read equipment" on public.equipment_items;
create policy "Public can read equipment"
on public.equipment_items for select
to anon, authenticated
using (true);

drop policy if exists "Admin can insert equipment" on public.equipment_items;
create policy "Admin can insert equipment"
on public.equipment_items for insert
to authenticated
with check (lower(auth.jwt() ->> 'email') = lower('jinhowhat@gmail.com'));

drop policy if exists "Admin can update equipment" on public.equipment_items;
create policy "Admin can update equipment"
on public.equipment_items for update
to authenticated
using (lower(auth.jwt() ->> 'email') = lower('jinhowhat@gmail.com'))
with check (lower(auth.jwt() ->> 'email') = lower('jinhowhat@gmail.com'));

drop policy if exists "Admin can delete equipment" on public.equipment_items;
create policy "Admin can delete equipment"
on public.equipment_items for delete
to authenticated
using (lower(auth.jwt() ->> 'email') = lower('jinhowhat@gmail.com'));

do $$
begin
  alter publication supabase_realtime add table public.equipment_items;
exception when duplicate_object then null;
when undefined_object then null;
end $$;

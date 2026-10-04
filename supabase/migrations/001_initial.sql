create extension if not exists pgcrypto;

create table if not exists public.contact_messages(
 id uuid primary key default gen_random_uuid(),
 name text not null check (char_length(trim(name)) between 1 and 120),
 email text not null check (char_length(trim(email)) between 3 and 320),
 message text not null check (char_length(trim(message)) between 1 and 5000),
 created_at timestamptz not null default now()
);

alter table public.contact_messages enable row level security;

drop policy if exists "Public can submit contact messages" on public.contact_messages;

create policy "Public can submit contact messages"
on public.contact_messages
for insert
to anon, authenticated
with check (
 char_length(trim(name)) between 1 and 120
 and char_length(trim(email)) between 3 and 320
 and char_length(trim(message)) between 1 and 5000
);

revoke all on public.contact_messages from public;
grant insert on public.contact_messages to anon, authenticated;

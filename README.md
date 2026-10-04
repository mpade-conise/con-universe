# Con Universe Business Website

Professional React + TypeScript business website for Con Universe.

## Stack
- React + Vite + TypeScript
- Supabase for data
- Vercel for deployment
- GitHub as the source repository

## Local development
1. Copy .env.example to .env.local.
2. Add the Supabase project URL and anon key.
3. Run npm install.
4. Run npm run dev.

## Supabase
Run supabase/migrations/001_initial.sql in the Supabase SQL Editor. The public client is only allowed to insert validated contact enquiries; it cannot read them.

## Vercel
Import this repository into Vercel and configure VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY as project environment variables. Do not commit .env.local or service-role credentials.

## Architecture
The frontend stays independent from Supabase-specific page logic. Database access is centralized under src/lib so additional features can reuse the same client cleanly.

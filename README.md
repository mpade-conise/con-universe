# Con Universe Business Website

Professional React + TypeScript business website for Con Universe, using GitHub for source control, Supabase for application data, and Vercel for deployment.

## Stack

- React + TypeScript + Vite
- Supabase
- Vercel
- GitHub

## Local setup

1. Install Node.js 20+.
2. Install dependencies with `npm install`.
3. Copy `.env.example` to `.env.local`.
4. Set `VITE_SUPABASE_URL` to the Supabase project URL.
5. Set `VITE_SUPABASE_ANON_KEY` to the Supabase publishable key.
6. Run `npm run dev`.

Never commit `.env.local` or any Supabase secret/service-role key.

## Supabase

Run `supabase/migrations/001_initial.sql` in the Supabase SQL Editor. It creates the contact-message table and its Row Level Security policies.

The frontend only uses the public publishable key. Database permissions are enforced by Supabase RLS.

## Vercel

Connect the GitHub repository to Vercel and add these Production, Preview, and Development environment variables:

- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`

Use the Supabase project URL and publishable key. Do not add a service-role key to the frontend or Vercel client-side environment.

## Architecture

The React frontend is kept independent from Supabase-specific page logic. Supabase initialization is centralized in `src/lib/supabase.ts`, while database schema and RLS policies are versioned under `supabase/migrations`.

## Deployment

Pushes to `main` are intended to deploy through Vercel automatically after the GitHub repository is connected.

Repository: https://github.com/mpade-conise/con-universe

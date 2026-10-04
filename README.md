# Con Universe Business Website

Professional React + TypeScript business website for Con Universe, using GitHub for source control, Supabase for application data, and Vercel for deployment.

## Stack

- React + TypeScript + Vite
- Supabase
- Vercel
- GitHub

## Environment

The application reads Supabase configuration only from Vite environment variables:

- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`

The production Supabase URL is `https://qbqmhcoxmbpcjredofxs.supabase.co`.

The publishable key is intentionally **not stored in GitHub**. Add it to Vercel environment variables instead. Never use a Supabase service-role/secret key in the browser.

## Supabase

Run `supabase/migrations/001_initial.sql` in the Supabase SQL Editor. It creates `public.contact_messages`, validation constraints, Row Level Security, and the minimum public insert permission required by the contact form.

The browser can submit a message but cannot read contact messages.

## Vercel

Connect this GitHub repository to Vercel and configure the two environment variables for Production, Preview, and Development:

- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`

After saving the variables, redeploy the project so the Vite build receives them.

## Development

`npm install`

`npm run dev`

`npm run build`

`npm run preview`

## Architecture

Supabase initialization is centralized in `src/lib/supabase.ts`. Database schema and RLS are versioned under `supabase/migrations`. The public website remains a static Vite application and only calls Supabase when the contact form is submitted.

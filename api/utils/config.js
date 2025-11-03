// PENTING: JANGAN HARDCODE API KEY DI SINI.
// Gunakan Vercel Environment Variables untuk mengisi nilai-nilai di bawah ini.
// https://vercel.com/docs/projects/environment-variables

export const config = {
  // --- Duitku Config ---
  // Ambil dari dashboard Duitku Anda
  DUITKU_MERCHANT_CODE: process.env.DUITKU_MERCHANT_CODE,
  DUITKU_API_KEY: process.env.DUITKU_API_KEY,
  
  // --- Pterodactyl Config ---
  // URL panel Pterodactyl Anda (PLTA)
  PLTA_HOST: process.env.PLTA_HOST, 
  // API Key Pterodactyl Anda (PLTA - Client API)
  PLTA_API_KEY: process.env.PLTA_API_KEY,

  // --- URL Callback ---
  // Ganti 'example.com' dengan domain Vercel Anda nanti
  // Ini tidak terlalu dipakai di logic ini, tapi Duitku membutuhkannya.
  CALLBACK_URL: process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}/api/callback` : 'https://example.com/api/callback',
  RETURN_URL: process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : 'https://example.com',
};

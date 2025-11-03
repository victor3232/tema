import { config } from './config.js';

/**
 * PENTING: GANTI FUNGSI INI DENGAN LOGIKA API PTERODACTYL ANDA
 * * Ini adalah fungsi MOCK/PALSU yang meniru pembuatan panel.
 * Anda harus mengisinya dengan logic Anda sendiri untuk:
 * 1. Membuat user di Pterodactyl (PLTA_HOST, PLTA_API_KEY)
 * 2. Membuat server untuk user tersebut
 */
export async function createUserAndServer({ username, product }) {
  console.log(`[MOCK] Membuat panel untuk ${username} dengan RAM ${product.ram} MB...`);
  console.log(`[MOCK] Menggunakan host: ${config.PLTA_HOST}`);

  // --- GANTI LOGIKA DI BAWAH INI ---
  
  // 1. Buat User (Contoh Panggilan API)
  /*
  try {
    const userPayload = {
      email: `${username}@${config.YOUR_DOMAIN || 'panel.com'}`,
      username: username,
      first_name: username,
      last_name: 'User',
      password: 'generate_password_disini' 
    };
    const userResponse = await axios.post(`${config.PLTA_HOST}/api/application/users`, userPayload, {
      headers: { 'Authorization': `Bearer ${config.PLTA_API_KEY}` }
    });
    const userId = userResponse.data.attributes.id;
    
    // 2. Buat Server (Contoh Panggilan API)
    const serverPayload = {
       name: `Server ${username}`,
       user: userId,
       nest: 1, // ID Nest (mis. Minecraft)
       egg: 1, // ID Egg (mis. Paper)
       limits: {
         memory: product.ram,
         swap: 0,
         disk: product.disk,
         io: 500,
         cpu: product.cpu
       },
       // ... dan data lainnya
    };
    const serverResponse = await axios.post(`${config.PLTA_HOST}/api/application/servers`, serverPayload, {
      headers: { 'Authorization': `Bearer ${config.PLTA_API_KEY}` }
    });

  } catch (error) {
     console.error("Gagal membuat panel Pterodactyl:", error.response ? error.response.data : error.message);
     return { 
       error: true, 
       details: error.response ? error.response.data : 'Gagal terhubung ke Pterodactyl' 
     };
  }
  */

  // Data palsu (hapus ini saat logic asli sudah ada)
  const generatedPassword = `pass_${Math.random().toString(36).slice(2, 10)}`;
  const account = {
    error: false,
    username: username,
    password: generatedPassword,
    email: `${username}@panel.com`,
    url: config.PLTA_HOST, // URL login
  };
  
  // --- BATAS AKHIR LOGIKA YANG HARUS DIGANTI ---
  
  console.log(`[MOCK] Panel sukses dibuat untuk ${username}.`);
  return account;
}

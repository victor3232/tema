import { createClient } from "@vercel/kv";

// PENTING: Anda harus setup Vercel KV di dashboard Vercel Anda.
// Environment variables (KV_REST_API_URL, dll.) akan otomatis ditambahkan oleh Vercel.
export const kv = createClient({
  url: process.env.KV_REST_API_URL,
  token: process.env.KV_REST_API_TOKEN,
});

// Helper function untuk menyimpan data order
// Kita set expiry (ex) 300 detik = 5 menit, sama seperti Duitku
export const saveOrder = async (orderId, data) => {
  return kv.set(orderId, data, { ex: 300 }); 
};

// Helper function untuk mengambil data order
export const getOrder = async (orderId) => {
  return kv.get(orderId);
};

// Helper function untuk update order (setelah dibayar)
export const updateOrder = async (orderId, data) => {
  // Hapus expiry time agar data panel tersimpan permanen
  return kv.set(orderId, data, { nx: false }); 
};

// Helper function untuk hapus order (jika gagal/dibatalkan)
export const deleteOrder = async (orderId) => {
  return kv.del(orderId);
};

// Ganti ini dengan daftar produk Anda
export const products = [
  { id: '1gb', ram: '1024', disk: '5120', cpu: '100', price: 2000, name: '1GB (Rp2.000)' },
  { id: '2gb', ram: '2048', disk: '10240', cpu: '200', price: 3000, name: '2GB (Rp3.000)' },
  { id: '3gb', ram: '3072', disk: '15360', cpu: '300', price: 4000, name: '3GB (Rp4.000)' },
  { id: '4gb', ram: '4096', disk: '20480', cpu: '400', price: 5000, name: '4GB (Rp5.000)' },
  { id: '5gb', ram: '5120', disk: '25600', cpu: '500', price: 6000, name: '5GB (Rp6.000)' },
  // Tambahkan produk lain...
];

export function getProductById(id) {
  return products.find(p => p.id === id);
}

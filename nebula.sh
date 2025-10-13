#!/bin/bash
# ============================================
# 🚀 Pterodactyl Nebula Installer (All-in-One)
# Author: kibiljoe
# Versi Modifikasi: Fully Automated Sequential Installer
# ============================================

# URL script eksternal disimpan dalam variabel agar mudah diubah
EXTERNAL_SCRIPT_URL="https://raw.githubusercontent.com/KiwamiXq1031/installer-premium/refs/heads/main/zero.sh"

clear
echo -e "============================================"
echo -e "   🌌 Pterodactyl Nebula Installer Menu"
echo -e "============================================"
echo -e "1) Install Semuanya (Depend + Tema Nebula) <-- PILIH INI UNTUK OTOMATIS"
echo -e "2) Install Depend Pterodactyl SAJA"
echo -e "3) Install Tema Nebula SAJA"
echo -e "0) Exit"
echo -e "============================================"
read -p "Pilih menu [0-3]: " choice

case $choice in
    1) # Opsi baru untuk install semuanya secara berurutan
        echo -e "\n🚀 Memulai instalasi lengkap (Dependensi lalu Tema)..."
        
        # --- TAHAP 1: INSTALL DEPENDENSI ---
        echo -e "\n[TAHAP 1/2] Menginstall dependensi pterodactyl..."
        sleep 2
        DEBIAN_FRONTEND=noninteractive bash <(curl -s "$EXTERNAL_SCRIPT_URL") <<EOF
11
A
Y
Y
EOF
        
        # Cek apakah Tahap 1 berhasil
        if [ $? -eq 0 ]; then
            echo -e "\n✅ [TAHAP 1/2] Berhasil install depend."
            
            # --- TAHAP 2: INSTALL TEMA (dijalankan otomatis) ---
            echo -e "\n[TAHAP 2/2] Melanjutkan install tema Nebula secara otomatis..."
            sleep 2
            DEBIAN_FRONTEND=noninteractive bash <(curl -s "$EXTERNAL_SCRIPT_URL") <<EOF
2


EOF
            # Cek apakah Tahap 2 berhasil
            if [ $? -eq 0 ]; then
                echo -e "\n✅ [TAHAP 2/2] Berhasil install tema Nebula."
                echo -e "\n🎉 SEMUA PROSES SELESAI!"
            else
                echo -e "\n❌ [TAHAP 2/2] Gagal install tema Nebula, cek error di atas!"
            fi
        else
            echo -e "\n❌ [TAHAP 1/2] Gagal install depend, proses dihentikan!"
        fi
        ;;
        
    2) # Opsi lama untuk install dependensi saja
        echo -e "\n🚀 Memulai instalasi depend pterodactyl SAJA..."
        sleep 2
        DEBIAN_FRONTEND=noninteractive bash <(curl -s "$EXTERNAL_SCRIPT_URL") <<EOF
11
A
Y
Y
EOF
        if [ $? -eq 0 ]; then
            echo -e "\n✅ Berhasil install depend."
        else
            echo -e "\n❌ Gagal install depend, cek error di atas!"
        fi
        ;;
        
    3) # Opsi lama untuk install tema saja
        echo -e "\n🌌 Memulai instalasi tema Nebula SAJA..."
        sleep 2
        DEBIAN_FRONTEND=noninteractive bash <(curl -s "$EXTERNAL_SCRIPT_URL") <<EOF
2


EOF
        if [ $? -eq 0 ]; then
            echo -e "\n✅ Berhasil install tema Nebula."
        else
            echo -e "\n❌ Gagal install tema Nebula, cek error di atas!"
        fi
        ;;
        
    0)
        echo -e "👋 Keluar..."
        exit 0
        ;;
        
    *)
   echo -e "❌ Pilihan tidak valid!"
        ;;
esac

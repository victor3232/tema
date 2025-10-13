#!/bin/bash
# ============================================
# 🚀 Pterodactyl Nebula Installer (All-in-One)
# Author: kibiljoe
# Versi Modifikasi: Fully Automated Sequential Installer with Screen
# ============================================

# --- BLOK OTOMATISASI SCREEN ---
if [ -z "$STY" ]; then
    echo "===================================================================="
    echo "Sesi ini tidak berjalan di dalam 'screen'. Mengonfigurasi secara otomatis..."
    echo "===================================================================="
    sleep 2

    if ! command -v screen &> /dev/null; then
        echo "'screen' tidak ditemukan. Memulai instalasi..."
        if [[ $EUID -ne 0 ]]; then
            sudo apt-get update && sudo apt-get install -y screen
        else
            apt-get update && apt-get install -y screen
        fi
        if ! command -v screen &> /dev/null; then
            echo "ERROR: Instalasi 'screen' gagal. Mohon install manual."
            exit 1
        fi
    fi

    echo "Membuat sesi 'screen' baru bernama 'nebula' dan menjalankan ulang script..."
    echo "Proses instalasi akan berjalan di latar belakang."
    echo -e "Gunakan perintah: \e[1;32mscreen -r nebula\e[0m untuk melihat prosesnya."
    echo "===================================================================="

    screen -dmS nebula bash -c "curl -sL ${BASH_SOURCE[0]} | bash"
    exit 0
fi
# --- AKHIR BLOK OTOMATISASI SCREEN ---

echo "===================================================================="
echo "Script berjalan di dalam sesi screen '$STY'. Instalasi aman dari timeout."
echo -e "Jika koneksi terputus, sambung kembali dan ketik: \e[1;32mscreen -r nebula\e[0m"
echo "===================================================================="
sleep 3

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

# Jika script dijalankan tanpa input interaktif, otomatis pilih '1'
if [ -t 0 ]; then
    read -p "Pilih menu [0-3]: " choice
else
    # Otomatis baca input dari pipe
    read choice
fi


case $choice in
    1)
        echo -e "\n🚀 Memulai instalasi lengkap (Dependensi lalu Tema)..."
        echo -e "\n[TAHAP 1/2] Menginstall dependensi pterodactyl..."
        sleep 2
        DEBIAN_FRONTEND=noninteractive bash <(curl -s "$EXTERNAL_SCRIPT_URL") <<EOF
11
A
Y
Y
EOF
        if [ $? -eq 0 ]; then
            echo -e "\n✅ [TAHAP 1/2] Berhasil install depend."
            echo -e "\n[TAHAP 2/2] Melanjutkan install tema Nebula secara otomatis..."
            sleep 2
            DEBIAN_FRONTEND=noninteractive bash <(curl -s "$EXTERNAL_SCRIPT_URL") <<EOF
2


EOF
            if [ $? -eq 0 ]; then
                echo -e "\n✅ [TAHAP 2/2] Berhasil install tema Nebula."
                echo -e "\n🎉 SEMUA PROSES SELESAI!"
            else
                echo -e "\n❌ [TAHAP 2/2] Gagal install tema Nebula."
            fi
        else
            echo -e "\n❌ [TAHAP 1/2] Gagal install depend."
        fi
        ;;
    2)
        echo -e "\n🚀 Memulai instalasi depend pterodactyl SAJA..."
        sleep 2
        DEBIAN_FRONTEND=noninteractive bash <(curl -s "$EXTERNAL_SCRIPT_URL") <<EOF
11
A
Y
Y
EOF
        ;;
    3)
        echo -e "\n🌌 Memulai instalasi tema Nebula SAJA..."
        sleep 2
        DEBIAN_FRONTEND=noninteractive bash <(curl -s "$EXTERNAL_SCRIPT_URL") <<EOF
2


EOF
        ;;
    0)
        echo -e "👋 Keluar..."
        exit 0
        ;;
    *)
        echo -e "❌ Pilihan tidak valid!"
        ;;
esac

# AI Local — Landing Page

Responsive landing page untuk bisnis layanan AI lokal. Dibangun dengan HTML, CSS,
dan JavaScript murni (tanpa framework). Dapat dijalankan langsung di server web
atau dikemas dengan Docker (Nginx Alpine).

## Struktur File

| File | Deskripsi |
|------|-----------|
| `index.html` | Halaman utama (hero, layanan, alur kerja, CTA, footer) |
| `Dockerfile` | Container Nginx Alpine untuk melayani halaman statis |
| `docker-compose.yml` | Konfigurasi docker-compose (port 8080:80) |
| `README.md` | Dokumentasi proyek (ini) |

## Fitur

- **Mobile-first**: desain responsif (desain comfort di ponsel)
- **Hero**: perkenalan dengan CTA utama dan visual mockup
- **Layanan**: daftar 4 layanan AI (chatbot, analitik, citra/video, otomatisasi)
- **Alur kerja**: 5 langkah dari konsultasi hingga dukungan
- **Tombol aksi**: "Mulai Gratis" dan "Lihat Layanan"
- **Vanilla JS**: smooth scroll, mobile menu, scroll reveal, animasi counter
- **Tanpa API key**: tidak ada kredensial rahasia dalam repositori

## Cara Menjalankan

### 1. Langsung (tanpa Docker)

Buka `index.html` di browser, atau arahkan server web ke folder ini:

```bash
python3 -m http.server 8000
# Buka http://localhost:8000
```

### 2. Dengan Docker

```bash
# Build image
docker build -t ailocalservice-web .

# Jalankan container (port 8080:80)
docker run -d --name ailocalservice -p 8080:80 ailocalservice-web
```

Akses di http://localhost:8080.

### 3. Dengan docker-compose

```bash
# Build dan jalankan
docker-compose up -d --build

# Akses di http://localhost:8080
```

### 4. Matikan container

```bash
docker-compose down
```

## Pemeriksaan

### Syntax JavaScript

```bash
# Ekstrak skrip inline ke file sementara dan cek
node --check <(sed -n '/<script>/,/<\/script>/p' index.html | sed '1d;$d')
```

### Konfigurasi Docker

```bash
# Cek format docker-compose
docker-compose config

# Build image (verifikasi Dockerfile)
docker build --check -t ailocalservice-web .
```

## Keamanan

- Tidak ada API key, token, atau data sensitif yang dimasukkan dalam proyek
- `docker-compose.yml` bersifat publik; untuk secret gunakan Docker secrets
  atau file `.env` yang tidak dikomitkan (tambahkan ke `.gitignore`)

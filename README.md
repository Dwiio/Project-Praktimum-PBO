# 🛵 Sistem Informasi Rental Motor (Java & MySQL)

[![Java](https://img.shields.io/badge/Java-SE%20%2F%20JDK%208%2B-007396?style=for-the-badge&logo=java&logoColor=white)](https://www.oracle.com/java/)
[![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

> **Sistem Informasi Rental Motor** adalah aplikasi berbasis **Java (Pemrograman Berbasis Objek)** yang terintegrasi dengan database **MySQL**. Aplikasi ini dirancang untuk mempermudah pengelolaan armada motor, data pelanggan, peminjaman, hingga perhitungan biaya sewa dan denda keterlambatan secara otomatis.

---

## ✨ Fitur Utama

- **Management Data Motor (CRUD)**:
  - Penambahan unit baru, pembaruan data, penghapusan, dan pencarian unit.
  - Pembaharuan status ketersediaan motor secara otomatis (*Tersedia* / *Disewa*).
- **Management Data Penyewa (Customer)**:
  - Pendataan identitas lengkap pelanggan (NIK KTP, Nama, No. Telepon, Alamat).
- **Transaksi Peminjaman & Pengembalian**:
  - Kalkulasi total biaya sewa secara otomatis berdasarkan durasi peminjaman (hari).
  - Perhitungan denda keterlambatan saat pengembalian unit.
- **Pencetakan / Output Struk Transaksi**:
  - Pencetakan rincian bukti sewa bagi pelanggan.

---

## 📐 Arsitektur & Penerapan Konsep PBO

Proyek ini menerapkan empat pilar utama Pemrograman Berbasis Objek:
- **Encapsulation**: Penggunaan akses modifier `private` pada atribut kelas model (seperti `Motor` dan `Penyewa`) dengan metode *getter* dan *setter*.
- **Inheritance**: Struktur hierarki kelas untuk jenis pengguna (misal: `Admin` dan `Customer` menuruni kelas induk `User`).
- **Polymorphism**: *Method Overriding* untuk perhitungan skema harga khusus atau diskon berdasarkan lama durasi sewa.
- **Abstraction**: Penggunaan *interface* atau *abstract class* untuk pemisahan logika transaksi dan operasi koneksi database (DAO Pattern).

---

## 🗂️ Struktur Repositori & File

```text
Project-Praktikum-PBO/
├── RentalMotorr.zip        # Source code utama proyek Java (IDE NetBeans/Eclipse)
├── rental_motor-3.sql      # Skrip skema database & data awal MySQL
└── README.md               # Dokumentasi proyek
```

---

## 🗄️ Skema Database (`rental_motor-3.sql`)

Aplikasi menggunakan database `rental_motor` yang mencakup beberapa tabel utama:

### 1. Tabel `motor`
| Field | Tipe Data | Keterangan |
| :--- | :--- | :--- |
| `id_motor` | VARCHAR(10) [PK] | Kode unik motor (e.g., MTR001) |
| `merk` | VARCHAR(50) | Merk & tipe motor (e.g., Honda Vario 160) |
| `plat_nomor` | VARCHAR(15) | Nomor polisi kendaraan |
| `harga_sewa_per_hari` | DOUBLE | Biaya sewa harian |
| `status` | ENUM('Tersedia', 'Disewa') | Ketersediaan unit motor |

### 2. Tabel `penyewa`
| Field | Tipe Data | Keterangan |
| :--- | :--- | :--- |
| `nik` | VARCHAR(16) [PK] | Nomor KTP penyewa |
| `nama` | VARCHAR(100) | Nama lengkap penyewa |
| `no_telp` | VARCHAR(15) | Nomor telepon/WhatsApp |
| `alamat` | TEXT | Alamat domisili penyewa |

### 3. Tabel `transaksi`
| Field | Tipe Data | Keterangan |
| :--- | :--- | :--- |
| `id_transaksi` | VARCHAR(10) [PK] | Kode transaksi (e.g., TRX001) |
| `nik_penyewa` | VARCHAR(16) [FK] | Relasi ke tabel `penyewa` |
| `id_motor` | VARCHAR(10) [FK] | Relasi ke tabel `motor` |
| `tgl_sewa` | DATE | Tanggal mulai sewa |
| `tgl_kembali` | DATE | Tanggal rencana pengembalian |
| `durasi_hari` | INT | Lama sewa (hari) |
| `total_biaya` | DOUBLE | Total tagihan sewa |
| `status_transaksi` | ENUM('Berjalan', 'Selesai') | Status transaksi |

---

## ⚙️ Cara Instalasi & Konfigurasi

### 1. Persyaratan Sistem
- **JDK (Java Development Kit)**: Versi 8 atau lebih baru.
- **Database Server**: XAMPP / Laragon / MySQL Server.
- **IDE**: NetBeans / IntelliJ IDEA / Eclipse / VS Code.
- **Driver**: MySQL JDBC Connector (`mysql-connector-j.jar`).

### 2. Import Database (MySQL)
1. Aktifkan service **MySQL** pada Control Panel XAMPP / Laragon Anda.
2. Buka **phpMyAdmin** (`http://localhost/phpmyadmin`).
3. Buat database baru dengan nama **`rental_motor`**.
4. Import file **`rental_motor-3.sql`** yang tersedia di repositori ke dalam database tersebut.

### 3. Setup Project di IDE
1. Ekstrak file **`RentalMotorr.zip`**.
2. Buka IDE Anda, pilih menu **Open Project**, lalu arahkan ke folder hasil ekstrak `RentalMotorr`.
3. Tambahkan library **MySQL JDBC Connector** ke dalam *Dependencies/Libraries* proyek.
4. Sesuaikan konfigurasi kredensial koneksi pada kelas Java `Koneksi.java` / `DBConnection.java`:
   ```java
   public class Koneksi {
       private static final String URL = "jdbc:mysql://localhost:3306/rental_motor";
       private static final String USER = "root";
       private static final String PASS = ""; // Sesuaikan dengan password MySQL Anda
       
       public static Connection getConnection() throws SQLException {
           return DriverManager.getConnection(URL, USER, PASS);
       }
   }
   ```
5. Jalankan aplikasi (*Run Project* / `Shift + F6`).

---

## 🖥️ Contoh Tampilan & Output Aplikasi

### 1. Tampilan Antarmuka (Tabel Data Unit Motor)
```text
===================================================================
                     SISTEM INFORMASI RENTAL MOTOR
===================================================================
[ Data Motor ]   [ Data Penyewa ]   [ Transaksi ]   [ Pengembalian ]
-------------------------------------------------------------------
ID Motor | Merk & Tipe         | Plat Nomor  | Harga/Hari | Status
-------------------------------------------------------------------
MTR001   | Honda Vario 160     | B 1234 CD E | Rp 100.000 | Tersedia
MTR002   | Yamaha NMAX 155     | B 5678 FGH  | Rp 120.000 | Disewa
MTR003   | Honda Beat 110      | B 9101 IJK  | Rp  75.000 | Tersedia
-------------------------------------------------------------------
```

### 2. Output Struk Transaksi Penyewaan
```text
=======================================================
                 STRUK SEWA MOTOR "SPEEDY"             
=======================================================
ID Transaksi     : TRX202607001
Tanggal Transaksi: 2026-07-23
-------------------------------------------------------
NIK Penyewa      : 3174012345670001
Nama Penyewa     : Budi Santoso
No. Telepon      : 081234567890
-------------------------------------------------------
ID Motor         : MTR002
Unit Motor       : Yamaha NMAX 155 (B 5678 FGH)
Harga / Hari     : Rp 120.000
Durasi Sewa      : 3 Hari
-------------------------------------------------------
TOTAL BIAYA      : Rp 360.000
Status Motor     : DISEWA
=======================================================
           Terima Kasih Atas Kepercayaan Anda!          
=======================================================
```

---

## 👥 Kontributor & Informasi Praktikum

Dokumentasi dan proyek ini disusun dalam rangka pemenuhan **Tugas Praktikum Pemrograman Berbasis Objek (PBO)**.

- **Mata Kuliah**: Pemrograman Berbasis Objek (PBO)
- **Bahasa Pemrograman**: Java (SE)
- **Database**: MySQL Server

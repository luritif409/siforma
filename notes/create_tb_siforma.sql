-- Pastikan menggunakan engine InnoDB
SET FOREIGN_KEY_CHECKS=0;
DROP DATABASE IF EXISTS sistem_akademik;
CREATE DATABASE sistem_akademik;
USE sistem_akademik;

-- 1. m_roles
CREATE TABLE m_roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 2. m_users
CREATE TABLE m_users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES m_roles(id)
) ENGINE=InnoDB;

-- 3. m_fakultas
CREATE TABLE m_fakultas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    kode_fakultas VARCHAR(10),
    nama_fakultas VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 4. m_prodi
CREATE TABLE m_prodi (
    id INT PRIMARY KEY AUTO_INCREMENT,
    kode_prodi VARCHAR(10),
    nama_prodi VARCHAR(100) NOT NULL UNIQUE,
    fakultas_id INT,
    FOREIGN KEY (fakultas_id) REFERENCES m_fakultas(id)
) ENGINE=InnoDB;

-- 5. m_matkul
CREATE TABLE m_matkul (
    id INT PRIMARY KEY AUTO_INCREMENT,
    kode_matkul VARCHAR(10),
    nama_matkul VARCHAR(100),
    sks_teori INT,
    sks_praktikum INT,
    prodi_id INT,
    FOREIGN KEY (prodi_id) REFERENCES m_prodi(id)
) ENGINE=InnoDB;

-- 6. m_kurikulum
CREATE TABLE m_kurikulum (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tahun_berlaku YEAR,
    prodi_id INT,
    status ENUM('aktif', 'nonaktif'),
    FOREIGN KEY (prodi_id) REFERENCES m_prodi(id)
) ENGINE=InnoDB;

-- 7. m_kurikulum_detail
CREATE TABLE m_kurikulum_detail (
    id INT PRIMARY KEY AUTO_INCREMENT,
    kurikulum_id INT,
    matkul_id INT,
    semester_pengambilan INT,
    FOREIGN KEY (kurikulum_id) REFERENCES m_kurikulum(id),
    FOREIGN KEY (matkul_id) REFERENCES m_matkul(id)
) ENGINE=InnoDB;

-- 8. m_dosen
CREATE TABLE m_dosen (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nip VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100),
    gelar VARCHAR(20),
    prodi_id INT,
    email VARCHAR(100),
    FOREIGN KEY (prodi_id) REFERENCES m_prodi(id)
) ENGINE=InnoDB;

-- 9. m_pengampu
CREATE TABLE m_pengampu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dosen_id INT,
    matkul_id INT,
    prodi_id INT,
    FOREIGN KEY (dosen_id) REFERENCES m_dosen(id),
    FOREIGN KEY (matkul_id) REFERENCES m_matkul(id),
    FOREIGN KEY (prodi_id) REFERENCES m_prodi(id)
) ENGINE=InnoDB;

-- 10. m_status_mahasiswa
CREATE TABLE m_status_mahasiswa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_status VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 11. m_mahasiswa
CREATE TABLE m_mahasiswa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nim VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100),
    prodi_id INT,
    angkatan YEAR,
    status_mahasiswa_id INT,
    email VARCHAR(100),
    FOREIGN KEY (prodi_id) REFERENCES m_prodi(id),
    FOREIGN KEY (status_mahasiswa_id) REFERENCES m_status_mahasiswa(id)
) ENGINE=InnoDB;

-- 12. m_kelas
CREATE TABLE m_kelas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_kelas VARCHAR(10),
    prodi_id INT,
    FOREIGN KEY (prodi_id) REFERENCES m_prodi(id)
) ENGINE=InnoDB;

-- 13. m_tahun_ajaran
CREATE TABLE m_tahun_ajaran (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_ta VARCHAR(20) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 14. m_semester
CREATE TABLE m_semester (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_semester VARCHAR(20),
    tahun_ajaran_id INT,
    tgl_mulai DATE,
    tgl_selesai DATE,
    FOREIGN KEY (tahun_ajaran_id) REFERENCES m_tahun_ajaran(id)
) ENGINE=InnoDB;

-- 15. m_jam_kuliah
CREATE TABLE m_jam_kuliah (
    id INT PRIMARY KEY AUTO_INCREMENT,
    waktu_mulai TIME,
    waktu_selesai TIME
) ENGINE=InnoDB;

-- 16. m_ruang
CREATE TABLE m_ruang (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_ruang VARCHAR(50),
    kapasitas INT
) ENGINE=InnoDB;

-- 17. m_jadwal_kuliah
CREATE TABLE m_jadwal_kuliah (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hari ENUM('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'),
    jam_kuliah_id INT,
    ruang_id INT,
    pengampu_id INT,
    kelas_id INT,
    semester_id INT,
    FOREIGN KEY (jam_kuliah_id) REFERENCES m_jam_kuliah(id),
    FOREIGN KEY (ruang_id) REFERENCES m_ruang(id),
    FOREIGN KEY (pengampu_id) REFERENCES m_pengampu(id),
    FOREIGN KEY (kelas_id) REFERENCES m_kelas(id),
    FOREIGN KEY (semester_id) REFERENCES m_semester(id)
) ENGINE=InnoDB;

-- 18. m_skala_nilai
CREATE TABLE m_skala_nilai (
    id INT PRIMARY KEY AUTO_INCREMENT,
    huruf VARCHAR(2),
    angka DECIMAL(3,1)
) ENGINE=InnoDB;

-- 19. m_komponen_nilai
CREATE TABLE m_komponen_nilai (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50),
    bobot DECIMAL(5,2)
) ENGINE=InnoDB;

-- 20. nilai_mahasiswa
CREATE TABLE nilai_mahasiswa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mahasiswa_id INT,
    matkul_id INT,
    grade_id INT,
    nilai_angka DECIMAL(5,2),
    komponen_nilai_id INT,
    semester_id INT,
    FOREIGN KEY (mahasiswa_id) REFERENCES m_mahasiswa(id),
    FOREIGN KEY (matkul_id) REFERENCES m_matkul(id),
    FOREIGN KEY (grade_id) REFERENCES m_skala_nilai(id),
    FOREIGN KEY (komponen_nilai_id) REFERENCES m_komponen_nilai(id),
    FOREIGN KEY (semester_id) REFERENCES m_semester(id)
) ENGINE=InnoDB;

-- 21. m_program_pendidikan
CREATE TABLE m_program_pendidikan (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_program VARCHAR(50)
) ENGINE=InnoDB;

-- 22. m_unit
CREATE TABLE m_unit (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_unit VARCHAR(100)
) ENGINE=InnoDB;

-- 23. m_mitra
CREATE TABLE m_mitra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_mitra VARCHAR(100),
    alamat TEXT
) ENGINE=InnoDB;

-- 24. d_all_dokumen (opsional)
CREATE TABLE d_all_dokumen (
    id INT PRIMARY KEY AUTO_INCREMENT,
    jenis_dokumen ENUM(
        'kurikulum',
        'rps',
        'sap',
        'penelitian',
        'pengabdian',
        'akreditasi',
        'laporan_tahunan',
        'rapat',
        'administrasi_umum',
        'kerjasama'
    ),
    ref_id INT,
    ref_type VARCHAR(50),
    nama_file VARCHAR(255),
    path_file VARCHAR(255),
    uploaded_by INT,
    tanggal_upload DATE,
    deskripsi TEXT,
    status ENUM('aktif', 'arsip', 'revisi'),
    FOREIGN KEY (uploaded_by) REFERENCES m_users(id)
) ENGINE=InnoDB;

-- 25. d_penelitian
CREATE TABLE d_penelitian (
    id INT PRIMARY KEY AUTO_INCREMENT,
    judul_penelitian VARCHAR(255),
    dosen_id INT,
    tahun INT,
    path_file VARCHAR(255),
    deskripsi TEXT,
    FOREIGN KEY (dosen_id) REFERENCES m_dosen(id)
) ENGINE=InnoDB;

-- 26. d_pengabdian
CREATE TABLE d_pengabdian (
    id INT PRIMARY KEY AUTO_INCREMENT,
    judul_pengabdian VARCHAR(255),
    dosen_id INT,
    tahun INT,
    path_file VARCHAR(255),
    deskripsi TEXT,
    FOREIGN KEY (dosen_id) REFERENCES m_dosen(id)
) ENGINE=InnoDB;

-- 27. d_akreditasi
CREATE TABLE d_akreditasi (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_akreditasi VARCHAR(255),
    prodi_id INT,
    tahun INT,
    path_file VARCHAR(255),
    deskripsi TEXT,
    FOREIGN KEY (prodi_id) REFERENCES m_prodi(id)
) ENGINE=InnoDB;

-- 28. d_laporan_tahunan
CREATE TABLE d_laporan_tahunan (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tahun INT,
    prodi_id INT,
    path_file VARCHAR(255),
    deskripsi TEXT,
    FOREIGN KEY (prodi_id) REFERENCES m_prodi(id)
) ENGINE=InnoDB;

-- 29. d_kerjasama
CREATE TABLE d_kerjasama (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mitra_id INT,
    judul_kerjasama VARCHAR(255),
    path_file VARCHAR(255),
    deskripsi TEXT,
    FOREIGN KEY (mitra_id) REFERENCES m_mitra(id)
) ENGINE=InnoDB;

-- 30. d_rps
CREATE TABLE d_rps (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matkul_id INT,
    path_file VARCHAR(255),
    tahun INT,
    FOREIGN KEY (matkul_id) REFERENCES m_matkul(id)
) ENGINE=InnoDB;

-- 31. d_sap
CREATE TABLE d_sap (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matkul_id INT,
    path_file VARCHAR(255),
    tahun INT,
    FOREIGN KEY (matkul_id) REFERENCES m_matkul(id)
) ENGINE=InnoDB;

-- 32. d_kurikulum
CREATE TABLE d_kurikulum (
    id INT PRIMARY KEY AUTO_INCREMENT,
    kurikulum_id INT,
    path_file VARCHAR(255),
    tahun INT,
    FOREIGN KEY (kurikulum_id) REFERENCES m_kurikulum(id)
) ENGINE=InnoDB;

-- 33. d_rapat
CREATE TABLE d_rapat (
    id INT PRIMARY KEY AUTO_INCREMENT,
    topik_rapat VARCHAR(255),
    tanggal DATE,
    path_file VARCHAR(255),
    deskripsi TEXT
) ENGINE=InnoDB;

-- 34. d_administrasi_umum
CREATE TABLE d_administrasi_umum (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_dokumen VARCHAR(255),
    path_file VARCHAR(255),
    deskripsi TEXT,
    tanggal_upload DATE
) ENGINE=InnoDB;
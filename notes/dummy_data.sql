-- 1. Insert m_roles
INSERT INTO m_roles (nama) VALUES
('admin'),
('dosen'),
('mahasiswa');

-- 2. Insert m_users
INSERT INTO m_users (username, password, role_id) VALUES
('admin', 'admin123', 1),
('dosen1', 'dosen123', 2),
('mahasiswa1', 'mahasiswa123', 3);

-- 3. Insert m_fakultas
INSERT INTO m_fakultas (kode_fakultas, nama_fakultas) VALUES
('FT', 'Fakultas Teknik'),
('FE', 'Fakultas Ekonomi');

-- 4. Insert m_prodi
INSERT INTO m_prodi (kode_prodi, nama_prodi, fakultas_id) VALUES
('IF', 'Teknik Informatika', 1),
('MN', 'Manajemen', 2);

-- 5. Insert m_matkul
INSERT INTO m_matkul (kode_matkul, nama_matkul, sks_teori, sks_praktikum, prodi_id) VALUES
('IF101', 'Pemrograman Dasar', 2, 1, 1),
('IF102', 'Algoritma dan Struktur Data', 3, 0, 1),
('MN101', 'Pengantar Manajemen', 3, 0, 2);

-- 6. Insert m_kurikulum
INSERT INTO m_kurikulum (tahun_berlaku, prodi_id, status) VALUES
(2024, 1, 'aktif'),
(2023, 2, 'nonaktif');

-- 7. Insert m_kurikulum_detail
INSERT INTO m_kurikulum_detail (kurikulum_id, matkul_id, semester_pengambilan) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);

-- 8. Insert m_dosen
INSERT INTO m_dosen (nip, nama, gelar, prodi_id, email) VALUES
('19800101101', 'Dr. Andi Prasetyo', 'S.T., M.T.', 1, 'andi@univ.ac.id'),
('19850101102', 'Budi Santoso, S.E.', 'S.E.', 2, 'budi@univ.ac.id');

-- 9. Insert m_pengampu
INSERT INTO m_pengampu (dosen_id, matkul_id, prodi_id) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 2);

-- 10. Insert m_status_mahasiswa
INSERT INTO m_status_mahasiswa (nama_status) VALUES
('Aktif'),
('Cuti'),
('Lulus'),
('DO');

-- 11. Insert m_mahasiswa
INSERT INTO m_mahasiswa (nim, nama, prodi_id, angkatan, status_mahasiswa_id, email) VALUES
('202401001', 'Siti Nurhaliza', 1, 2024, 1, 'siti@univ.ac.id'),
('202402001', 'Rina Putri', 2, 2024, 1, 'rina@univ.ac.id');

-- 12. Insert m_kelas
INSERT INTO m_kelas (nama_kelas, prodi_id) VALUES
('A', 1),
('B', 1),
('Reguler', 2);

-- 13. Insert m_tahun_ajaran
INSERT INTO m_tahun_ajaran (nama_ta) VALUES
('2024/2025'),
('2023/2024');

-- 14. Insert m_semester
INSERT INTO m_semester (nama_semester, tahun_ajaran_id, tgl_mulai, tgl_selesai) VALUES
('Ganjil 2024/2025', 1, '2024-08-01', '2025-01-30'),
('Genap 2024/2025', 1, '2025-02-01', '2025-07-30');

-- 15. Insert m_jam_kuliah
INSERT INTO m_jam_kuliah (waktu_mulai, waktu_selesai) VALUES
('07:00:00', '08:40:00'),
('08:40:00', '10:20:00');

-- 16. Insert m_ruang
INSERT INTO m_ruang (nama_ruang, kapasitas) VALUES
('Lab Komputer A', 30),
('Ruang Kuliah B', 40);

-- 17. Insert m_skala_nilai
INSERT INTO m_skala_nilai (huruf, angka) VALUES
('A', 4.0),
('B+', 3.5),
('B', 3.0),
('C+', 2.5),
('C', 2.0),
('D', 1.0),
('E', 0.0);

-- 18. Insert m_komponen_nilai
INSERT INTO m_komponen_nilai (nama, bobot) VALUES
('UTS', 30),
('UAS', 40),
('Tugas', 20),
('Kuis', 10);

-- 19. Insert nilai_mahasiswa
INSERT INTO nilai_mahasiswa (mahasiswa_id, matkul_id, grade_id, nilai_angka, komponen_nilai_id, semester_id) VALUES
(1, 1, 1, 85.5, 1, 1),
(1, 1, 1, 85.5, 2, 1),
(1, 1, 1, 85.5, 3, 1);

-- 20. Insert m_mitra
INSERT INTO m_mitra (nama_mitra, alamat) VALUES
('PT. Teknologi Edukasi', 'Jl. Raya IT No. 10 Jakarta'),
('Universitas MIT Malaysia', 'Jalan Pendidikan No. 1 Kuala Lumpur');

-- 21. Insert d_penelitian
INSERT INTO d_penelitian (judul_penelitian, dosen_id, tahun, path_file, deskripsi) VALUES
('Pemanfaatan AI di Pendidikan', 1, 2024, '/files/penelitian/ai_pendidikan.pdf', 'Penelitian tentang penggunaan AI di dunia pendidikan');

-- 22. Insert d_pengabdian
INSERT INTO d_pengabdian (judul_pengabdian, dosen_id, tahun, path_file, deskripsi) VALUES
('Pelatihan Coding untuk Anak Sekolah', 1, 2024, '/files/pengabdian/coding_anak.pdf', 'Program pengabdian kepada masyarakat');

-- 23. Insert d_akreditasi
INSERT INTO d_akreditasi (nama_akreditasi, prodi_id, tahun, path_file, deskripsi) VALUES
('Akreditasi Prodi Informatika 2024', 1, 2024, '/files/akreditasi/if2024.pdf', 'Akreditasi program studi Teknik Informatika');

-- 24. Insert d_laporan_tahunan
INSERT INTO d_laporan_tahunan (tahun, prodi_id, path_file, deskripsi) VALUES
(2024, 1, '/files/laporan/tahunan2024_if.pdf', 'Laporan tahunan Teknik Informatika 2024');

-- 25. Insert d_kerjasama
INSERT INTO d_kerjasama (mitra_id, judul_kerjasama, path_file, deskripsi) VALUES
(1, 'Kerjasama Pengembangan Startup', '/files/kerjasama/mitra_startup.pdf', 'MoU Kerjasama');

-- 26. Insert d_rps
INSERT INTO d_rps (matkul_id, path_file, tahun) VALUES
(1, '/files/rps/rps_if101.pdf', 2024);

-- 27. Insert d_sap
INSERT INTO d_sap (matkul_id, path_file, tahun) VALUES
(1, '/files/sap/sap_if101.pdf', 2024);

-- 28. Insert d_kurikulum
INSERT INTO d_kurikulum (kurikulum_id, path_file, tahun) VALUES
(1, '/files/kurikulum/kurikulum_if2024.pdf', 2024);

-- 29. Insert d_rapat
INSERT INTO d_rapats (topik_rapat, tanggal, path_file, deskripsi) VALUES
('Rapat Evaluasi Semester Ganjil', '2024-01-10', '/files/rapat/evaluasi_ganjil.pdf', 'Rapat evaluasi akhir semester ganjil');

-- 30. Insert d_administrasi_umum
INSERT INTO d_administrasi_umum (nama_dokumen, path_file, deskripsi, tanggal_upload) VALUES
('Surat Keputusan Rektor Nomor 10', '/files/administrasi/sk_rektor_10.pdf', 'SK Rektor tentang kurikulum baru', '2024-08-01');
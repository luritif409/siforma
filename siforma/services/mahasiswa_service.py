from siforma import db
from siforma.models import Mahasiswa

def tambah_mahasiswa(data):
    nama = data.get('nama')
    nim = data.get('nim')
    prodi_id = data.get('prodi_id')
    angkatan = data.get('angkatan')
    status_mahasiswa_id = data.get('status_mahasiswa_id')
    email = data.get('email')

    if not nama or not nim:
        return {"error": "Nama dan NIM diperlukan"}, 400
    

    mhs_baru = Mahasiswa(
        nama=nama,
        nim=nim,
        prodi_id=prodi_id,
        angkatan=angkatan,
        status_mahasiswa_id=status_mahasiswa_id,
        email=email
    )

    db.session.add(mhs_baru)
    db.session.commit()

    return {
        "message": "Mahasiswa berhasil ditambahkan",
        "data": {
            "id": mhs_baru.id,
            "nama": mhs_baru.nama,
            "nim": mhs_baru.nim
        }
    }, 201

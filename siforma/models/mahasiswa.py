from siforma import db

class Mahasiswa(db.Model):
    __tablename__ = 'm_mahasiswa'
    id = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.String(100))
    nim = db.Column(db.String(20), unique=True)
    prodi_id = db.Column(db.Integer)
    angkatan = db.Column(db.String(4))
    status_mahasiswa_id = db.Column(db.Integer)
    email = db.Column(db.String)
    def __repr__(self):
        return f'<Mahasiswa {self.nama}>'



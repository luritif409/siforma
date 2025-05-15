from app import app, db

with app.app_context():
    try:
        # Mencoba melakukan koneksi
        db.engine.connect()
        print("✅ Koneksi ke database berhasil!")
    except Exception as e:
        print("❌ Gagal terhubung ke database:")
        print(str(e))
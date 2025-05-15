from flask import Blueprint, jsonify, request
# from siforma.models.mahasiswa import Mahasiswa
# from app import app, db
from siforma import db
from siforma.services.mahasiswa_service import tambah_mahasiswa

main = Blueprint('main', __name__)

# Endpoint: /siforma/api/data
@main.route('/siforma/api/data', methods=['GET'])
def get_data():
    return jsonify({
        "message": "Berhasil menerima GET request!",
        "data": "Ini adalah data dari server"
    })

# Endpoint: /siforma/api/data (POST)
@main.route('/siforma/api/data', methods=['POST'])
def post_data():
    body = request.get_json()  # Ambil JSON dari body request
    return jsonify({
        "message": "Berhasil menerima POST request!",
        "received_data": body
    })

# Endpoint: /siforma/api/data (PUT)
@main.route('/siforma/api/data', methods=['PUT'])
def put_data():
    body = request.get_json()
    return jsonify({
        "message": "Berhasil menerima PUT request!",
        "updated_data": body
    })

# Endpoint: /siforma/api/data (DELETE)
@main.route('/siforma/api/data', methods=['DELETE'])
def delete_data():
    return jsonify({
        "message": "Berhasil menerima DELETE request!"
    })


@main.route('/siforma/api/mahasiswa', methods=['POST'])
def create_mahasiswa():
    data = request.get_json()
    response, status = tambah_mahasiswa(data)
    return jsonify(response), status


@main.route('/test-db')
def test_db():
    result = db.session.execute("SELECT DATABASE();")
    current_db = result.fetchone()[0]
    return jsonify({"message": "Connected to database", "database": current_db})
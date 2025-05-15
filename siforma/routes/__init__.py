# siforma/__init__.py

from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def create_app():
    app = Flask(__name__)

    # Muat konfigurasi dari file
    app.config.from_pyfile('../config.py')

    # Inisialisasi db
    db.init_app(app)

    # Import route
    from siforma.routes.main_routes import main
    app.register_blueprint(main)

    return app
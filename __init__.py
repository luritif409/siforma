from flask import Flask
from flask_sqlalchemy import SQLAlchemy

# Membuat objek app & db di __init__.py
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/siforma_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Import routes setelah db siap
from siforma.routes.main_routes import main
app.register_blueprint(main)
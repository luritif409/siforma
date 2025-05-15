import os

structure = {
    "yourproject": {
        "__init__.py": "",
        "config.py": """
import os

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'secret-key'
    SQLALCHEMY_DATABASE_URI = 'sqlite:///app.db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
""",
        "routes": {
            "__init__.py": "",
            "main_routes.py": """
from flask import Blueprint, render_template

main = Blueprint('main', __name__)

@main.route('/')
def home():
    return render_template('home.html')
"""
        },
        "models": {
            "__init__.py": "",
            "user.py": """
from yourproject import db

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)

    def __repr__(self):
        return f'<User {self.username}>'
"""
        },
        "services": {
            "__init__.py": "",
            "user_service.py": """
from yourproject.models.user import User
from yourproject import db

def create_user(username):
    new_user = User(username=username)
    db.session.add(new_user)
    db.session.commit()
    return new_user
"""
        },
        "utils": {
            "__init__.py": "",
            "helpers.py": """
from datetime import datetime

def format_datetime(value, format='%Y-%m-%d'):
    return value.strftime(format)
"""
        },
        "templates": {
            "base.html": """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{% block title %}{% endblock %}</title>
    <link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
</head>
<body>
    {% block content %}{% endblock %}
</body>
</html>
""",
            "home.html": """
{% extends "base.html" %}
{% block title %}Beranda{% endblock %}
{% block content %}
<h1>Selamat Datang di Aplikasi Anda</h1>
<p>Ini adalah halaman beranda.</p>
{% endblock %}
"""
        },
        "static": {
            "style.css": """
body {
    font-family: Arial, sans-serif;
    margin: 40px;
}
"""
        }
    },
    "instance": {
        "config.py": """
SQLALCHEMY_DATABASE_URI = 'sqlite:///instance.db'
DEBUG = True
"""
    },
    "migrations": {
        "__placeholder__": ".gitkeep"
    },
    "tests": {
        "test_app.py": """
import pytest
from yourproject import create_app

@pytest.fixture
def client():
    app = create_app()
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home(client):
    response = client.get('/')
    assert response.status_code == 200
"""
    },

    "requirements.txt": """
flask
flask-sqlalchemy
flask-migrate
pytest
""",
    "wsgi.py": """
from yourproject import create_app

app = create_app()

if __name__ == '__main__':
    app.run()
""",
    "run.py": """
from yourproject import create_app

app = create_app()

if __name__ == '__main__':
    app.run(debug=True)
""",
    "README.md": "# Flask Modular Project\nTemplate proyek modular Flask siap pakai",
    ".gitignore": """

__pycache__
*.pyc
*.db
.DS_Store
.env
__pycache__
"""
}

def create_structure(base_path, struct):
    for name, content in struct.items():
        path = os.path.join(base_path, name)
        if isinstance(content, dict):
            os.makedirs(path, exist_ok=True)
            create_structure(path, content)
        else:
            with open(path, 'w') as f:
                f.write(content.strip() + "\n")

if __name__ == "__main__":
    project_dir = "yourproject-template"
    os.makedirs(project_dir, exist_ok=True)
    create_structure(project_dir, structure)
    print(f"[✅] Struktur proyek berhasil dibuat di folder: {project_dir}")
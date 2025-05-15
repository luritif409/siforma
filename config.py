import os

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'secret-key'
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:@localhost/siforma'
    SQLALCHEMY_TRACK_MODIFICATIONS = False

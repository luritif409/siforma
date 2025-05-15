from siforma.models.user import User
from siforma import db

def create_user(username):
    new_user = User(username=username)
    db.session.add(new_user)
    db.session.commit()
    return new_user
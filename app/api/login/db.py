from app import db
from app.models import User
from flask_login import login_user
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import timedelta


def signup_post(username, email, password):
    # query DbManager first to make sure user has not already signed up
    user = User.query.filter_by(email=email).first()
    if user:
        return {
            'success': False,
            'message': 'email has already been registered'
        }

    new_user = User(email=email, username=username, password=generate_password_hash(password, method='sha256'))
    db.session.add(new_user)
    db.session.commit()
    return {
        'success': True,
        'data': {
            'username': username,
            'email': email,
            'password': password
        }
    }


def login_post(email, password, remember):
    user = User.query.filter_by(email=email).first()
    if not user:
        return {
            'success': False,
            'message': 'No Such User'
        }
    if not check_password_hash(user.password, password):
        return {
            'success': False,
            'message': 'Incorrect Password'
        }

    login_user(user, remember=remember, duration=timedelta(hours=0.5))
    return {
        'success': True,
        'data': {
            'email': email,
            'password': password,
            'remember': remember
        }
    }


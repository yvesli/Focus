from flask import request
from . import db, api
import json
from flask_login import login_required, logout_user


# auth = Blueprint('auth', __name__)

# login post route, should get request data containing email, password and remember
@api.route('/login', methods=['POST'])
def login_post():
    data = json.loads(request.data)
    email = data.get('email')
    password = data.get('password')
    remember = data.get('remember')
    res = db.login_post(email, password, remember)
    next = request.args.get('next')
    if not res['success']:
        return json.dumps(res), 422
    return json.dumps(res), 200


@api.route('/login')
def login():
    return json.dumps({
        'message': 'Please log in to access this page'
    })


@api.route('/signup', methods=['POST'])
def signup_post():
    post_body = json.loads(request.data)
    username = post_body.get('username')
    email = post_body.get('email')
    password = post_body.get('password')
    res = db.signup_post(username, email, password)
    if res['success']:
        return json.dumps(res), 200
    return json.dumps(res), 422


@api.route('/logout')
@login_required
def logout():
    logout_user()
    return 'this is logout route', 200

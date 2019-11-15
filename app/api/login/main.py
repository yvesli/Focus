from app.api import api
from flask_login import login_required, current_user
import json


@api.route('/')
def index():
    return json.dumps({
        'success': True,
        'data': 'This is api index route'
    }), 200


@api.route('/profile')
@login_required
def profile():
    name = current_user.username
    return 'welcome! ' + name, 200

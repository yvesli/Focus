from flask_login import LoginManager
from app.api import api
from app import app
from app.api import url_prefix


def init_login_mamager(app):
    login_manager = LoginManager()
    login_manager.login_view = 'api.login'
    login_manager.init_app(app)

    from app.models import User

    @login_manager.user_loader
    def load_user(user_id):
        return User.query.get(int(user_id))


from . import auth
from . import main


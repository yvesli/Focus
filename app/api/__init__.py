# from flask import Flask
# from flask_sqlalchemy import SQLAlchemy
#
# db_filename = 'hc.db'
#
# api = Flask(__name__, template_folder='frontend/web')
# api.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
# api.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# api.config['SQLALCHEMY_ECHO'] = True
#
# # set secrete key to some random bytes
# api.secret_key = Flask.secret_key
# db = SQLAlchemy(api)

from flask import Blueprint

api = Blueprint('api', __name__)
url_prefix = '/api'


from app.api import login

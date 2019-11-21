from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os

db_filename = 'hc.db'
dia = 'postgresql'
ip = '34.73.159.18'
password = 'Silly425'
username = 'yveslyf'


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

# set secrete key to some random bytes
app.secret_key = os.urandom(24)
db = SQLAlchemy(app)

from app.api.login import init_login_mamager
init_login_mamager(app)

from app.views import index
app.register_blueprint(index)

from app.api import api
app.register_blueprint(api, url_prefix='/api')


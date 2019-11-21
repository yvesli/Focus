from app import app, db
from flask import Blueprint

from app import models
db.create_all()

index = Blueprint('index', __name__)


@index.route('/')
def thisislanding():
    return 'main', 200


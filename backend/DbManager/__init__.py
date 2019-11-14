from flask_sqlalchemy import SQLAlchemy


# create a singleton Db class
class Db:
    _instance = None

    @staticmethod
    def get_instance():
        if Db._instance is None:
            Db()
        return Db._instance

    def __init__(self):
        if self._instance is not None:
            raise Exception("This is a singleton class!")
        Db._instance = self
        self.db = SQLAlchemy()

    def init_app(self, app):
        self.db.init_app(app)
        self.db.create_all()

    def get_db(self):
        return self.db

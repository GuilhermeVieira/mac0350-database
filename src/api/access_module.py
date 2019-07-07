import databases
from database_handler import load_session, func
from flask_login import LoginManager, UserMixin

class AccessModule:
    session, Base = load_session(databases.urls['DATABASE_ACCESS_URL'])

    def __init__(self):
        '''
        for item in self.session.query(User.us_id):
            print(item.first())
        '''
        return

    def create_user(self, email, password):
        try:
            self.session.execute(func.cria_usuario(email, password))
            self.session.commit()
            return True
        except Exception as e:
            return str(e)

    def authenticate_user(self, email, password):
        try:
            return self.session.execute(func.verifica_senha(email, password)).first()[0]
        except Exception as e:
            print('Erro: ' + str(e))
            return None

    def get_user_by_id(self, us_id):
        return self.session.query(User).get(us_id)

    def get_user_by_email(self, us_email):
        return self.session.query(User).filter_by(us_email=str(us_email)).first()

    def is_allowed(self, us_id, service):
        try:
            return self.session.execute(func.tem_acesso(us_id, service)).first()[0]
        except Exception as e:
            print('Error: ' + str(e))
            return False

class User(UserMixin, AccessModule.Base):
    __tablename__ = 'users'
    __table_args__ = { 'autoload': True }

    def get_id(self):
        return self.us_id

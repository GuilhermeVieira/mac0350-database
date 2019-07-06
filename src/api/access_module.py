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

    def get_user(self, user_id):
        return self.session.query(User).get(int(user_id))

class User(UserMixin, AccessModule.Base):
    __tablename__ = 'users'
    __table_args__ = { 'autoload': True }

    def get_id(self):
        return self.us_id



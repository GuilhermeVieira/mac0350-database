import databases
from database_handler import load_session, func

class AccessModule(): 
    def __init__(self):
        self.session = load_session(databases.urls['DATABASE_ACCESS_URL'])
    
    def create_user(self, email, password):
        try:
            self.session.execute(func.cria_usuario(email, password))
            self.session.commit()
            return True
        except Exception as e:
            return str(e)

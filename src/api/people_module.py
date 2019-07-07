import databases
from database_handler import load_session, func

class PeopleModule: 
    session, Base = load_session(databases.urls['DATABASE_PEOPLE_URL'])
    
    def __init__(self):
        return

    def get_name(self, nusp):
        try:
            return self.session.execute(func.recupera_nome(nusp)).first()[0]
        except Exception as e:
            print('Erro: ' + e)
            return 'NOT FOUND'

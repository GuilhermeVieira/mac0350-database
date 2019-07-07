import databases
from database_handler import load_session, func

class CurriculumModule:
    session, Base = load_session(databases.urls['DATABASE_CURRICULUM_URL'])

    def __init__(self):
        return

    def verifica_disciplina_existe(self, data_ini, dpto, cod):
        try:
            return self.session.execute(func.verifica_disciplina_existe(data_ini, dpto, cod))
        except Exception as e:
            print('Erro: ' + str(e))
            return None

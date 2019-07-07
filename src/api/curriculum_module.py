import databases
from database_handler import load_session, func

class CurriculumModule:
    session, Base = load_session(databases.urls['DATABASE_CURRICULUM_URL'])

    def __init__(self):
        return

    def planeja_disciplina(self, email):
        try:
            self.session.execute(func.cria_usuario(email, password))
            self.session.commit()
            return True
        except Exception as e:
            return str(e)

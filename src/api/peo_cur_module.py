import databases
from database_handler import load_session, func

class PeoCurModule:
    session, Base = load_session(databases.urls['DATABASE_PEO_CUR_URL'])

    def __init__(self):
        return

    def planeja_disciplina(self, al_nusp, data_ini, departamento, codigo, ano, semestre):
        try:
            self.session.execute(func.planeja_disciplina(al_nusp, data_ini, departamento, codigo, ano, semestre))
            self.session.commit()
            return True
        except Exception as e:
            print(str(e))
            return None

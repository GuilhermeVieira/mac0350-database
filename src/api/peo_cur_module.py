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

    def remove_planejamento(self, al_nusp, data_ini, departamento, codigo):
        try:
            self.session.execute(func.remove_planejamento(al_nusp, data_ini, departamento, codigo))
            self.session.commit()
            return True
        except Exception as e:
            print(str(e))
            return None

    def pega_lista_de_desejos(self, al_nusp):
        try:
            return self.session.execute(func.pega_lista_de_desejos(al_nusp))
        except Exception as e:
            print(str(e))
            return None

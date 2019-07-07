import databases
from database_handler import load_session, func

class AccPeoModule:
    session, Base = load_session(databases.urls['DATABASE_ACC_PEO_URL'])

    def __init__(self):
        return

    def get_user_nusp(self, email):
        try:
            return self.session.execute(func.recupera_nusp_rel_us_pe(email)).first()[0]
        except Exception as e:
            print('Error: ' + str(e))
            return None

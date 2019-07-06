from sqlalchemy import create_engine, func
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base

def load_session(database_url):
    engine = create_engine(database_url)
    Session = sessionmaker(bind = engine)
    session = Session()

    return session
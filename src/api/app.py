import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager, UserMixin


projectName = "GradUSP"

app = Flask(projectName)

app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
accessdb = SQLAlchemy(app)
login_manager = LoginManager()
login_manager.init_app(app)

class User(UserMixin, accessdb.model):

@app.route('/')
def login():
    return render_template('login.html')

app.run()


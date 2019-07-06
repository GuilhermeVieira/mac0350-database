import os
from access_module import AccessModule
from flask import Flask, render_template, request
from flask_login import LoginManager, UserMixin

project_name = "GradUSP"

app = Flask(project_name, template_folder = './templates')

login_manager = LoginManager()
login_manager.init_app(app)

accessdb = AccessModule()
accessdb.create_user('blackstenius@protonmail.com', 'passw0rd')

@app.route('/')
def login():
    return render_template('login.html')

app.run()


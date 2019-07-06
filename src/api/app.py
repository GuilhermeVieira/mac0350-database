import os
from access_module import AccessModule
from flask import Flask, render_template, request
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user

project_name = "GradUSP"

app = Flask(project_name, template_folder = './templates')
app.config['SECRET_KEY'] = b'\xe8\x11\xbcO\xdcHw#\xcbI0c\x0f\x96\x19w'

login_manager = LoginManager()
login_manager.init_app(app)

accessdb = AccessModule()

@login_manager.user_loader
def load_user(user_id):
    return accessdb.get_user(user_id)

@app.route('/')
def login():
    user = accessdb.get_user(1)
    login_user(user)
    #return render_template('login.html')
    return 'You are logged in!'

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return 'You are now logged out!'

@app.route('/home')
@login_required
def home():
    return 'The current user is ' + current_user.us_email

app.run()


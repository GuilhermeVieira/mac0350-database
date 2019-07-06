import os
from access_module import AccessModule
from flask import Flask, render_template, request
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user

project_name = "GradUSP"

app = Flask(project_name, template_folder = './templates')
app.config['SECRET_KEY'] = b'\xe8\x11\xbcO\xdcHw#\xcbI0c\x0f\x96\x19w'

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'

accessdb = AccessModule()

@login_manager.user_loader
def load_user(us_id):
    return accessdb.get_user_by_id(us_id)

@app.route('/')
def login():
    return render_template('login.html')

@app.route('/logmein', methods = ['POST'])
def logmein():
    email = request.form['email']
    password = request.form['password']
    user = accessdb.get_user_by_email(email)

    if not user:
        return 'User not found'

    if accessdb.authenticate_user(email, password):
        login_user(user)
        return 'You are now logged in'

    return 'Invalid credentials! Try logging in again'

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


import os
from access_module import AccessModule
from flask import Flask, render_template, redirect, url_for
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from flask_bootstrap import Bootstrap
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField
from wtforms.validators import InputRequired, Email, Length

project_name = "GradUSP"

app = Flask(project_name, template_folder = './templates')
app.config['SECRET_KEY'] = b'\xe8\x11\xbcO\xdcHw#\xcbI0c\x0f\x96\x19w'

bootstrap = Bootstrap(app)

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = '/'

accessdb = AccessModule()

@login_manager.user_loader
def load_user(us_id):
    return accessdb.get_user_by_id(us_id)


# Forms

class LoginForm(FlaskForm):
    email = StringField('email', validators=[InputRequired(), Length(min=4, max=32)])
    password = PasswordField('password', validators=[InputRequired(), Length(min=8, max=80)])
    remember = BooleanField('remember me')

# Routes
@app.route('/', methods = ['GET', 'POST'])
def login():
    form = LoginForm()

    if form.validate_on_submit():
        user = accessdb.get_user_by_email(form.email.data)
        if user:
            if accessdb.authenticate_user(form.email.data, form.password.data):
                login_user(user, remember = form.remember.data)
                return redirect(url_for('home'))
        return '<h1>Invalid username or password</h1>'

    return render_template('login.html', form = form)

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))

@app.route('/home')
@login_required
def home():
    return 'The current user is ' + current_user.us_email

app.run()


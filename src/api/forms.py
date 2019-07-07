from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField
from wtforms.validators import InputRequired, Email, Length

class LoginForm(FlaskForm):
    email = StringField('E-mail', validators=[InputRequired(), Length(min=4, max=32)])
    password = PasswordField('Senha', validators=[InputRequired(), Length(min=8, max=80)])
    remember = BooleanField('Lembrar')

class CriaUsuarioForm(FlaskForm):
    email = StringField('E-mail', validators=[InputRequired(), Length(min=4, max=32)])
    password = PasswordField('Senha', validators=[InputRequired(), Length(min=8, max=80)])
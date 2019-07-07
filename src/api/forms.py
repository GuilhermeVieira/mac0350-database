from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, IntegerField
from wtforms.validators import InputRequired, Email, Length, NumberRange

class LoginForm(FlaskForm):
    email = StringField('E-mail', validators=[InputRequired(), Length(min=4, max=32)])
    password = PasswordField('Senha', validators=[InputRequired(), Length(min=8, max=80)])
    remember = BooleanField('Lembrar')

class PlanejaDisciplinaForm(FlaskForm):
    data_inicio = StringField('Data de início', validators=[InputRequired(), Length(min=4, max=4)])
    departamento = StringField('Departamento', validators=[InputRequired(), Length(min=3, max=3)])
    codigo = StringField('Código', validators=[InputRequired(), Length(min=4, max=4)])
    ano = StringField('Ano', validators=[InputRequired(), Length(min=4, max=4)])
    semestre = IntegerField('Semestre', validators=[InputRequired(), NumberRange(min=1, max=2)])

class CriaUsuarioForm(FlaskForm):
    email = StringField('E-mail', validators=[InputRequired(), Length(min=4, max=32)])
    password = PasswordField('Senha', validators=[InputRequired(), Length(min=8, max=80)])

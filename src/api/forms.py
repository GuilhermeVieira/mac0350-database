from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, IntegerField
from wtforms.validators import InputRequired, Email, Length, NumberRange

class LoginForm(FlaskForm):
    email = StringField('E-mail', validators=[InputRequired(), Length(min=4, max=32)])
    password = PasswordField('Senha', validators=[InputRequired(), Length(min=8, max=80)])
    remember = BooleanField('Lembrar')

class RecuperaNomeForm(FlaskForm):
    nusp = IntegerField('Número USP', validators=[InputRequired(), NumberRange(min=1, max=999999999)])

class PlanejaDisciplinaForm(FlaskForm):
    data_inicio = StringField('Data de início', validators=[InputRequired(), Length(min=4, max=4)])
    departamento = StringField('Departamento', validators=[InputRequired(), Length(min=3, max=3)])
    codigo = StringField('Código', validators=[InputRequired(), Length(min=4, max=4)])
    ano = StringField('Ano', validators=[InputRequired(), Length(min=4, max=4)])
    semestre = IntegerField('Semestre', validators=[InputRequired(), NumberRange(min=1, max=2)])

class RemovePlanejamentoForm(FlaskForm):
    data_inicio = StringField('Data de início', validators=[InputRequired(), Length(min=4, max=4)])
    departamento = StringField('Departamento', validators=[InputRequired(), Length(min=3, max=3)])
    codigo = StringField('Código', validators=[InputRequired(), Length(min=4, max=4)])

class AdicionaDisciplinaForm(FlaskForm):
    data_inicio = StringField('Data de início', validators=[InputRequired(), Length(min=4, max=4)])
    departamento = StringField('Departamento', validators=[InputRequired(), Length(min=3, max=3)])
    codigo = StringField('Código', validators=[InputRequired(), Length(min=4, max=4)])
    jupiter_link = StringField('Endereço no júpiterweb', validators=[InputRequired(), Length(max=100)])
    nome = StringField('Nome', validators=[InputRequired(), Length(max=100)])
    descricao = StringField('Descrição', validators=[InputRequired(), Length(max=100)])
    data_fim = StringField('Data de término', validators=[InputRequired(), Length(min=4, max=4)])
    cred_al = IntegerField('Créditos Aula', validators=[InputRequired()])
    cred_tr = IntegerField('Créditos Trabalho', validators=[InputRequired()])

class CriaUsuarioForm(FlaskForm):
    email = StringField('E-mail', validators=[InputRequired(), Length(min=4, max=32)])
    password = PasswordField('Senha', validators=[InputRequired(), Length(min=8, max=80)])

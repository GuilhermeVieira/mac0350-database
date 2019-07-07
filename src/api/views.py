from app import app, accessdb, acc_peodb, peopledb, peo_curdb, curriculumdb
import forms
from flask_bootstrap import Bootstrap
from flask import render_template, redirect, url_for
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user

# Bootstrap
bootstrap = Bootstrap(app)

# Login Manager Configuration
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = '/'

@login_manager.user_loader
def load_user(us_id):
    return accessdb.get_user_by_id(us_id)

# Routes
@app.route('/', methods = ['GET', 'POST'])
def login():
    form = forms.LoginForm()

    if form.validate_on_submit():
        user = accessdb.get_user_by_email(form.email.data)
        if user:
            if accessdb.authenticate_user(form.email.data, form.password.data):
                login_user(user, remember = form.remember.data)
                return redirect(url_for('home', profile_id = user.us_id))
        return '<h1>Email ou senha inválidos.</h1>'

    return render_template('login.html', form = form)

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))

@app.route('/home/<profile_id>')
@login_required
def home(profile_id):
    if current_user.us_id != int(profile_id):
        return 'Unauthorized: You do not have the right credentials to access this page!'

    nusp = acc_peodb.get_user_nusp(current_user.us_email)
    if not nusp:
        return 'Usuário ainda não vinculado com número USP'
    return render_template('dashboard.html', name = peopledb.get_name(nusp), CONTENT = {})

@app.route('/home/<profile_id>/usuario')
@login_required
def usuario(profile_id):
    if current_user.us_id != int(profile_id):
        return 'Unauthorized: You do not have the right credentials to access this page!'
    return 'Usuário page'

@app.route('/home/<profile_id>/aluno')
@login_required
def aluno(profile_id):
    if current_user.us_id != int(profile_id):
        return 'Unauthorized: You do not have the right credentials to access this page!'

    CONTENT = {
        "Services": [
            ["Planeja disciplina", "planeja_disciplina"],
            ["Remove planejamento", "remove_planejamento"],
            ["Pega lista de desejos", "pega_lista_de_desejos"]
        ]
    }
    return render_template('dashboard.html', name = peopledb.get_name(acc_peodb.get_user_nusp(current_user.us_email)), CONTENT = CONTENT)

@app.route('/home/<profile_id>/professor')
@login_required
def professor(profile_id):
    if current_user.us_id != int(profile_id):
        return 'Unauthorized: You do not have the right credentials to access this page!'
    return 'Professor page'

@app.route('/home/<profile_id>/administrador')
@login_required
def administrador(profile_id):
    if current_user.us_id != int(profile_id):
        return 'Unauthorized: You do not have the right credentials to access this page!'
    return 'Administrador page'

@app.route('/home/<profile_id>/dba')
@login_required
def dba(profile_id):
    if current_user.us_id != int(profile_id):
        return 'Unauthorized: You do not have the right credentials to access this page!'

    CONTENT = {
        "Services": [
            ["Cria usuário", "cria_usuario"]
        ]
    }
    return render_template('dashboard.html', name = peopledb.get_name(acc_peodb.get_user_nusp(current_user.us_email)), CONTENT = CONTENT)

# Aluno services
@app.route('/home/<profile_id>/planeja_disciplina', methods=['GET', 'POST'])
@login_required
def planeja_disciplina(profile_id):
    if not accessdb.is_allowed(current_user.us_id, 'planeja_disciplina'):
        return 'Unauthorized: You do not have the right credentials to access this page!'

    form = forms.PlanejaDisciplinaForm()
    if form.validate_on_submit():
        if not curriculumdb.verifica_disciplina_existe(form.data_inicio.data, form.departamento.data, form.codigo.data):
            return '<h1>Disciplina não existe no banco de dados.</h1>'
        nusp = acc_peodb.get_user_nusp(current_user.us_email)
        if peo_curdb.planeja_disciplina(nusp, form.data_inicio.data, form.departamento.data, form.codigo.data, form.ano.data, form.semestre.data):
            return redirect(url_for('planeja_disciplina', profile_id = current_user.us_id))
        return '<h1>Erro.</h1>'
    return render_template('planeja_disciplina.html', form = form)

@app.route('/home/<profile_id>/remove_planejamento')
@login_required
def remove_planejamento(profile_id):
    if not accessdb.is_allowed(current_user.us_id, 'remove_planejamento'):
        return 'Unauthorized: You do not have the right credentials to access this page!'

    return render_template('remove_planejamento.html')

@app.route('/home/<profile_id>/pega_lista_de_desejos')
@login_required
def pega_lista_de_desejos(profile_id):
    if not accessdb.is_allowed(current_user.us_id, 'pega_lista_de_desejos'):
        return 'Unauthorized: You do not have the right credentials to access this page!'

    return render_template('planeja_disciplina.html')

# DBA Services
@app.route('/home/<profile_id>/cria_usuario', methods=['GET', 'POST'])
@login_required
def cria_usuario(profile_id):
    if not accessdb.is_allowed(current_user.us_id, 'cria_usuario'):
        return 'Unauthorized: You do not have the right credentials to access this page!'

    form = forms.CriaUsuarioForm()
    if form.validate_on_submit():
        if accessdb.create_user(form.email.data, form.password.data):
            return redirect(url_for('cria_usuario', profile_id = current_user.us_id))
        return '<h1>Email ou senha inválidos.</h1>'
    return render_template('cria_usuario.html', form = form)

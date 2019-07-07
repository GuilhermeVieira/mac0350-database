from app import app, accessdb, acc_peodb, peopledb
from forms import LoginForm
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
    form = LoginForm()

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
    return render_template('dashboard.html', name = peopledb.get_name(nusp))

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
    return 'Aluno page'

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
    return 'DBA page'
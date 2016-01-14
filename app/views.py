from flask import render_template, flash, redirect, session, url_for, request
from flask.ext.login import login_user, logout_user, current_user, login_required
from app import app, bcrypt, db, lm
from form import SignupForm, LoginForm
from models import User

@lm.user_loader
def load_user(id):
  return User.query.get(int(id))

@app.route('/')
@app.route('/index')
def index():
  return render_template('index.html.j2')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
  form = SignupForm()
  if form.validate_on_submit():
    user = User(
        first_name=form.first_name.data,
        last_name=form.last_name.data,
        email=form.email.data,
        student_id=form.student_id.data,
        phone_num=form.phone_num.data,
        password=form.password.data
      )
    user.remove_dash_from_phone_num()
    db.session.add(user)
    db.session.commit()
    login_user(user)
    return redirect(url_for('index'))
  return render_template('signup.html.j2', form=form)

@app.route('/login', methods=['GET', 'POST'])
def login():
  if request.method == 'GET':
    return render_template('login.html.j2')

@app.route('/logout')
def logout():
  session.pop('username', None)
  return redirect(url_for('index'))
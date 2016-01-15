from flask import render_template, flash, redirect, url_for, request, session
from flask.ext.login import login_user, logout_user, current_user, login_required
from sqlalchemy.exc import IntegrityError
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

    try:
      db.session.add(user)
      db.session.commit()
      login_user(user)
      session['logged_in'] = True
      return redirect(url_for('index'))

    except IntegrityError: # Prevent user from having multiple account
      flash("The Student ID already exist in the system!")

  return render_template('signup.html.j2', form=form)

@app.route('/login', methods=['GET', 'POST'])
def login():
  form = LoginForm(request.form)
  if request.method == 'POST':
    if form.validate_on_submit():
      user = User.query.filter_by(email=request.form['email']).first()
      if user is not None and bcrypt.check_password_hash(user.password, request.form['password']):
        login_user(user)
        session['logged_in'] = True
        flash('You were logged in!')
        return redirect(url_for('index'))
      else:
        flash('Invalid email or password!')
  
  # If user already logged in
  if 'logged_in' in session and session['logged_in'] == True:
    return redirect(url_for('index'))

  return render_template('login.html.j2', form=form)

@app.route('/logout')
@login_required
def logout():
  logout_user()
  session.pop('logged_in', None)
  return redirect(url_for('index'))
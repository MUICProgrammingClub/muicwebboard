from flask_wtf import Form
from wtforms import TextField, PasswordField
from wtforms.validators import DataRequired, Length, Email, EqualTo

class SignupForm(Form):
  first_name = TextField('first_name', validators=[DataRequired()])
  last_name = TextField('last_name', validators=[DataRequired()])
  email = TextField('email', validators=[DataRequired(), Email(message=None), Length(min=6, max=40)])
  student_id = TextField('student_id', validators=[DataRequired()])
  phone_num = TextField('phone_num', validators=[DataRequired()])
  password = PasswordField('password', validators=[DataRequired(), Length(min=6, max=25)])
  confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), EqualTo('password', message='Passwords must match.')])

class LoginForm(Form):
  email = TextField('Email', validators=[DataRequired()])
  password = PasswordField('Password', validators=[DataRequired()])
    
  
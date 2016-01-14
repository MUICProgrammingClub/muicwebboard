from app import db, bcrypt

class User(db.Model):
  __tablename__ = "users"
  
  id = db.Column(db.Integer, primary_key=True)
  first_name = db.Column(db.String(64), nullable=False)
  last_name = db.Column(db.String(64), nullable=False)
  email = db.Column(db.String(40), index=True, unique=True, nullable=False)
  student_id = db.Column(db.String(7), unique=True, nullable=False)
  phone_num = db.Column(db.String(10), unique=True, nullable=False)
  password = db.Column(db.String, nullable=False)

  def __init__(self, first_name, last_name, email, student_id, phone_num, password):
    self.first_name = first_name
    self.last_name = last_name
    self.email = email
    self.student_id = student_id
    self.phone_num = phone_num
    self.password = bcrypt.generate_password_hash(password)

  def remove_dash_from_phone_num(self):
    s = ""
    for i in self.phone_num:
      if i != "-":
        s += i
    self.phone_num = s

  def is_authenticated(self):
    return True

  def is_active(self):
    return True

  def is_anonymous(self):
    return False

  def get_id(self):
    return unicode(self.id)

  def __repr__(self):
    return '<User %r>' % (self.email)

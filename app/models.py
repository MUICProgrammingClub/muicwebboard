from app import db

class User(db.Model):
  id = db.Column(db.Integer, primary_key=True)
  first_name = db.Column(db.String(64), nullable=False)
  last_name = db.Column(db.String(64), nullable=False)
  email = db.Column(db.String(120), index=True, unique=True, nullable=False)
  student_id = db.Column(db.String(7), unique=True, nullable=False)
  phone_num = db.Column(db.String(10), unique=True, nullable=False)
  password = db.Column(db.String, nullable=False)

  def __repr__(self):
    return '<User %r>' % (self.email)
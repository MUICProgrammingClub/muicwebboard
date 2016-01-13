from app import db

class User(db.Model):
  id = db.Column(db.Integer, primary_key=True)
  first_name = db.Column(db.String(64))
  last_name = db.Column(db.String(64))
  email = db.Column(db.String(120), index=True, unique=True)
  student_id = db.Column(db.String(7), unique=True)
  phone_num = db.Column(db.String(10), unique=True)

  def __repr__(self):
    return '<User %r>' % (self.email)